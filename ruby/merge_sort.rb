def merge_sort(inputs)
  return inputs if inputs.size == 1
  if inputs.size == 2
    return [inputs[1], inputs[0]] if inputs[0] > inputs[1]
    return inputs
  end

  puts "merge_sort: inputs #{inputs}, left: #{inputs.slice(0...inputs.size/2)}, right: #{inputs.slice(inputs.size/2..inputs.size)}"
  merge(
    merge_sort(inputs.slice(0...inputs.size/2)),
    merge_sort(inputs.slice(inputs.size/2..inputs.size))
  )
end

def merge(left, right)
  puts "merge: left #{left}, right #{right} #{left.class}"
  result = []
  idx_left = 0
  idx_right = 0
  while(idx_left < left.size && idx_right < right.size) do
    if (left[idx_left] < right[idx_right])
      result << left[idx_left]
      idx_left = idx_left + 1
    else
      result << right[idx_right]
      idx_right = idx_right + 1
    end
  end
  result = (result << left.slice(idx_left..left.size-1) << right.slice(idx_right..right.size-1)).flatten
  puts "merge result #{result}"
  result
end

puts "#{merge_sort([4,3,1,2,5,6])}"
