=begin
Write a method called each_with_index. It should take an Array as an argument, 
and a block. It should yield each element and an index number to the block. 
each_with_index should return a reference to the original Array.

Your method may use #each, #each_with_object, #inject, loop, for, while, or 
until to iterate through the Array passed in as an argument, but must not use 
  any other methods that iterate through an Array or any other collection.
=end


=begin
  - iterate through values of array
  - yield index number and current value
  - return original array
=end

def each_with_index(collection)
  curr_index = 0
  while curr_index < collection.size
    curr_value = collection[curr_index]
    yield(curr_value, curr_index)
    curr_index += 1
  end 

  collection
end

result = each_with_index([1, 3, 6]) do |value, index|
  puts "#{index} -> #{value**index}"
end

puts result == [1, 3, 6]