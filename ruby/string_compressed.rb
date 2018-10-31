def string_compress(input)
  f = {}
  # String immutability - Java string
  result = ""
  last_seen = nil
  input.chars.each do |i|
    if i != last_seen
      f[i] = 1 # I wrongly initialised to 0
      # I used the wrong index
      # Note for performance I used << which is like Java StringBuilder, not using =+ which will create a new String instance everytime
      result = result << last_seen << f[last_seen].to_s if last_seen # depending on the immutability
      last_seen = i
    else
      f[i]+=1
    end
  end
  # I forgot to flush at the end
  result = result << last_seen << f[last_seen].to_s
  puts result
  result
end

# Test
p string_compress("aabbccc") == "a2b2c3" ? "pass" : "fail"
p string_compress("abcd") == "a1b1c1d1" ? "pass" : "fail"
p string_compress("aaaaaaaab") == "a8b1" ? "pass" : "fail"
