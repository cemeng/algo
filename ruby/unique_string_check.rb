# Reference CTCI Arrays & String Problem 1.1
# Implement an algo to determine if a string has all unique characters.

# assumption to ask: is character ASCII -> 128 / 256 chars? or unicode? 65k
def all_unique_characters?(input)
  # Important: early return if the input is longer than 128/256 as it must have contain duplicates
  return false if input.size > 128

  # if hashmap is allowed
  # approach: iterate the string, have a hashmap / array to compare if a character has been seen.
  seen_characters = {}
  input.chars.each do |c| # iteration O(n)
    return false if seen_characters[c] # hash map lookup O(1)
    seen_characters[c] = 1
  end
  # runtime O(n), space O(n) for array and apparently hash is also O(n)?

  true
end

puts all_unique_characters?("abcde")
puts all_unique_characters?("abcee")

# without any data structure
def all_unique_characters_no_data?(input)
  input_chars = input.chars
  input_size = input.size
  return false if input_size > 128

  input_chars.each_with_index do |c, i| # iteration O(n)
    j = i + 1
    while(j < input_size) do
      return false if c == input_chars[j]
      j = j + 1
    end
  end
  # runtime O(n^2), space O(1)

  true
end

puts all_unique_characters_no_data?("abcde")
puts all_unique_characters_no_data?("abcee")
