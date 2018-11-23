def quick_sort(inputs)
  return inputs if inputs.size == 1
  if inputs.size == 2
    if inputs[0] < inputs[1]
      return [inputs[0], inputs[1]]
    else
      return [inputs[1], inputs[0]]
    end
  end

  # pick the last element as pivot
  pivot = inputs[inputs.size-1]

  left_idx = 0
  right_idx = inputs.size-1

  while left_idx < right_idx
    puts "looping pivot value#{pivot} : left: #{left_idx} - #{inputs[left_idx]}, right: #{right_idx}: #{inputs[right_idx]}"
    # swap
    if inputs[left_idx] > pivot && inputs[right_idx] <= pivot
      left_value = inputs[left_idx]
      inputs[left_idx] = inputs[right_idx]
      inputs[right_idx] = left_value
      left_idx = left_idx + 1
      right_idx = right_idx - 1
    end
    # already correct
    if inputs[left_idx] < pivot
      left_idx = left_idx + 1
    end
    if inputs[right_idx] >= pivot
      right_idx = right_idx - 1
    end
  end
  puts "result #{inputs}"

  (quick_sort(inputs[0..left_idx]) + quick_sort(inputs[left_idx+1..inputs.size-1])).flatten
end

puts "#{quick_sort([4,7,1,2,5,6])}"

