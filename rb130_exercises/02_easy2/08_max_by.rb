=begin
Write a method called max_by. It should take an Array and a block, and return 
the element that contains the largest value.

If the Array is empty, max_by should return nil.

Your method may use #each, #each_with_object, #each_with_index, #inject, loop, 
for, while, or until to iterate through the Array passed in as an argument, 
but must not use any other methods that iterate through an Array or any other 
collection.
=end

=begin
  set variable to largest sum to be first element of array
  set variable to 1 to represent curr_index

  -iterate through each element starting at index 1
    - if value is larger than sum, 
      - set value to sum
    - increment index by 1
  - return largest sum variable


=end

def max_by(array)
  return nil if array.empty?
  largest_value = yield(array[0])
  ind_of_largest_value = 0
  curr_index = 1

  while curr_index < array.size 
    yielded_value = yield(array[curr_index])
    if yielded_value > largest_value
      largest_value = yielded_value
      ind_of_largest_value = curr_index
    end 
    curr_index += 1
  end 

  array[ind_of_largest_value]
end

max_by([1, 5, 3]) { |value| value + 2 } == 5
max_by([1, 5, 3]) { |value| 9 - value } == 1
max_by([1, 5, 3]) { |value| (96 - value).chr } == 1
max_by([[1, 2], [3, 4, 5], [6]]) { |value| value.size } == [3, 4, 5]
max_by([-7]) { |value| value * 3 } == -7
max_by([]) { |value| value + 5 } == nil