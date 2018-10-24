def find_candy(source)
  # group into buckets first
  buckets = {} # hash map
  source.each do |candy|
    if buckets[candy]
      buckets[candy] = buckets[candy] + 1
    else
      buckets[candy] = 1
    end
  end
  result = []
  # collect from each buckets
  # this is stupid
  while(result.size < source.size/2) do
    buckets.keys.each do |candy|
      if buckets[candy] > 0
        result << candy
        buckets[candy]  = buckets[candy] - 1
      end
    end
  end

  puts result
end

# find_candy([1, 3, 3, 4, 4 ,7, 7, 7])
find_candy([80, 80, 80, 80, 80, 80, 80, 80, 123456789, 1000000000])
