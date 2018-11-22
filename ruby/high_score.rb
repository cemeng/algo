# Write a method that takes:
# an array of unsorted_scores
# the highest_possible_score in the game
# and returns a sorted array of scores in less than O(n log n) time.

# unsorted_scores = [37, 89, 41, 65, 91, 53]
# HIGHEST_POSSIBLE_SCORE = 100
#
# sort_scores(unsorted_scores, HIGHEST_POSSIBLE_SCORE)
# returns [91, 89, 65, 53, 41, 37]

# merge sort is O(n log n)
# quick sort is O(n log n), with worst case of O(n^2)
# this is quite tough - well I can try do merge sort
# merge sort

# to make this an O(n) - I can just create a hash map with the highest possible score
# and iterate the hashmap - YES!!!!
# all of the sort problem, you can solve with hash?


def high_scores(scores, high_score)

  # hashing(scores, high_score)
  reverse_merge_sort(scores)
end

def hashing(scores, high_score)
  # create hashmap with the length of high score
  result = []
  map = {}
  scores.each do |n|
    map[n] = true
  end # O(n)
  n = high_score
  while n > 0 do
    result << n if map[n]
    n = n - 1
  end # O(n)
  puts "result #{result}"
end

def reverse_merge_sort(scores) # returns sorted array
  size = scores.size
  left = scores[0..size/2-1]
  right = scores[size/2..size-1]

  if scores.size == 1
    return scores
  elsif scores.size == 2
    if scores[0] > scores[1]
      return [scores[0], scores[1]]
    else
      return [scores[1], scores[0]]
    end
  else
    puts "dividing #{left}, #{right}"
    result = merge(
      reverse_merge_sort(left),
      reverse_merge_sort(right)
    )
    return result
  end
end

def merge(left, right)
  # watch out for uneven left and right arrays
  # basically compare each element of left and right arrays and add them to the result
  idx_left = 0
  idx_right = 0
  result = []
  # loop until idx_left < left.size
  while idx_left < left.size && idx_right < right.size do
    if left[idx_left] > right[idx_right]
      result << left[idx_left]
      idx_left = idx_left + 1
    elsif left[idx_left] < right[idx_right]
      result << right[idx_right]
      idx_right = idx_right + 1
    else
      result << right[idx_right]
      idx_right = idx_right + 1
    end
  end

  # we have to flush the leftovers
  if idx_left < left.size
    while idx_left < left.size
      result << left[idx_left]
      idx_left = idx_left + 1
    end
  end

  if idx_right < right.size
    while idx_right < right.size
      result << right[idx_right]
      idx_right = idx_right + 1
    end
  end

  puts "merge result #{result}, left: #{left}, right: #{right}"
  result
end

puts high_scores([37, 89, 41, 41, 91, 53], 100)
