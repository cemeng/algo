def quick_sort(inputs)
  # find a pivot
  # use the pivot value to put a "wall"

  return inputs if inputs.size == 1
  if inputs.size == 2
    if inputs[0] > inputs[1]
      return [inputs[0], inputs[1]]
    else
      return [inputs[1], inputs[0]]
    end
  end

  # pick the last element as pivot
  pivot = inputs[inputs.size-1]
  puts "pivot #{pivot}"

  inputs.each_with_index do |i, idx|
    if i > pivot
      # swap
      this_value = inputs[idx]
      puts  "this value #{this_value}"
      inputs[i] = pivot
      inputs[inputs.size-1] = this_value
      puts "swap happens, #{i}, #{idx}, #{this_value},#{inputs}"
      # do this again
      left = inputs[0..idx]
      right = inputs[idx+1..inputs.size-1]
      inputs = quick_sort(left) + quick_sort(right)
    end
    if idx == inputs.size-1
      # rightmost is the max already
      inputs = quick_sort(inputs[0..inputs.size-2])
    end
  end
  inputs
end

puts "#{quick_sort([4,3,1,2,5,6])}"

