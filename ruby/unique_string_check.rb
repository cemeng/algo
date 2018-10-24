# Reference CTCI Arrays & String Problem 1.1
# Implement an algo to determine if a string has all unique characters.

def all_unique_characters?(input)
  # assumption to ask: is character ASCII -> 128 / 256 chars? or unicode? 65k

  # if hashmap is allowed
  # approach: iterate the string, have a hashmap / array to compare if a character has been seen.
  seen_characters = {}
  input.chars.each do |c| # iteration O(n)
    return false if seen_characters[c] # hash map lookup O(1)
    seen_characters[c] = 1
  end
  # runtime O(n), space O(n) + hash (?)

  true
end

puts all_unique_characters?("abcde")
puts all_unique_characters?("abcee")
