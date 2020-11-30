=begin
Write a method called each_cons that behaves similarly for Arrays, taking the 
elements 2 at a time. The method should take an Array as an argument, and a 
block. It should yield each consecutive pair of elements to the block, and 
return nil.

Your method may use #each, #each_with_object, #each_with_index, #inject, loop, 
for, while, or until to iterate through the Array passed in as an argument, 
but must not use any other methods that iterate through an Array or any other 
collection.
=end

def each_cons(array)
  idx1, idx2 = 0, 1
  while idx2 < array.size
    yield(array[idx1], array[idx2])
    idx1 += 1
    idx2 += 1
  end
  nil
end

hash = {}
result = each_cons([1, 3, 6, 10]) do |value1, value2|
  hash[value1] = value2
end
result == nil
hash 
hash == { 1 => 3, 3 => 6, 6 => 10 }

hash = {}
result = each_cons([]) do |value1, value2|
  hash[value1] = value2
end
hash == {}
result == nil

hash = {}
result = each_cons(['a', 'b']) do |value1, value2|
  hash[value1] = value2
end
hash == {'a' => 'b'}
result == nil