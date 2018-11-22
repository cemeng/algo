# search in rotated array
# you are given an array of numbers that has been rotated x numer of times
# search an element on that array
# example: 10,15,20,0,5
# 50,5,20,30,40
#
# we could brute force search that wil be O(n) which is the worst case for a search.
# we could implement binary search which will be O(log n) - however binary search
# won't work without modification since the array is not sorted, but rather is a semi-sorted.
# however we should make use of the fact that the array is "semi-sorted".
# we can perform binary search on the sorted part

# what are the output - if just boolean it's ok
def find_element(elem, elems)
  puts "iterate #{elems}"
  if (elems.size == 1)
    if elems[0] == elem
      return true
    else
      return false
    end
  end

  mid_point = elems.size/2
  puts "mid point #{elems[mid_point]}"

  # right hand is sorted
  if elems[mid_point] < elems[mid_point+1] && elems[mid_point] < elem
    # perform binary search just on the right
    result = find_element(elem, elems[mid_point+1..elems.size-1])
  elsif elems[mid_point] > elems[mid_point-1] && elems[mid_point] > elem
    # perform binary search just on the left
    result = find_element(elem, elems[0..mid_point])
  else
    # we cannot tell so perform on both
    puts "perform on both"
    result = find_element(elem, elems[elems.size/2+1..elems.size-1])
    unless result
      result = find_element(elem, elems[0..elems.size/2])
    end
  end

  # normal binary search on sorted
  # if elems[mid_point] > elem
  #   result = find_element(elem, elems[0..elems.size/2-1])
  # else
  #   result = find_element(elem, elems[elems.size/2..elems.size-1])
  # end
  puts ""

  result
end

puts find_element(5, [15,16,19,20,25,1,3,4,5,7,10,14])
