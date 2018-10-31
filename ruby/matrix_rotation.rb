input = [
  [1,2,3,4],
  [5,6,7,8],
  [9,10,11,12],
  [13,14,15,16],
]

expected_result = [
  [13,9,5,1],
  [14,10,6,2],
  [15,11,7,3],
  [16,12,8,4],
]

def rotate(input)
  result = [
    [nil,nil,nil,nil],
    [nil,nil,nil,nil],
    [nil,nil,nil,nil],
    [nil,nil,nil,nil],
  ]

  # we need to rotate 3 spaces at a time
  # do outer then rotate inside
  # runtime complexity O(n), space complexity O(2n)
  # outer:
  # first row becomes last column on each row
  # first column becomes first row
  # last row becomes leftmost column
  # last column becomes bottom row

  # I

  (0..2).each do |i|
    result[0][i] = source_of('left', input, input.size-1-i) # top
    result[i][input.size-1] = source_of('top', input, i) # right
    result[input.size-1][i+1] = source_of('right', input, input.size-2-i) # bottom - we need to reverse the order
    result[i+1][0] = source_of('bottom', input, i+1) # left
  end

  # rotate inner
  result[1][1] = input[2][1]
  result[1][2] = input[1][1]
  result[2][2] = input[1][2]
  result[2][1] = input[2][2]

  pretty_print result
  result
end

def pretty_print(input)
  input.each do |rows|
    p "[#{rows[0]}] [#{rows[1]}] [#{rows[2]}] [#{rows[3]}] "
    puts ""
  end
end

def source_of(pos, input, index)
  return input[index][0] if pos == 'left'
  return input[0][index] if pos == 'top'
  return input[index][input.size-1] if pos == 'right'
  return input[input.size-1][index] if pos == 'bottom'
end

p rotate(input) == expected_result ? "pass" : "fail"
