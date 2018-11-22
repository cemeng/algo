# To do this, you'll need data. Write code that takes a long string and builds
# its word cloud data in a hash ↴ ,
# where the keys are words and the values are the number of times the words occurred.
#
# Think about capitalized words. For example, look at these sentences:
#
#   "After beating the eggs, Dana read the next step:"
# "Add milk and eggs, then add flour and sugar."
# What do we want to do with "After", "Dana", and "add"? In this example, your final hash should include one "Add" or "add" with a value of 22. Make reasonable (not necessarily perfect) decisions about cases like "After" and "Dana".
#
# Assume the input will only contain words and standard punctuation.