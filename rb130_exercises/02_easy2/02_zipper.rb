=begin
Write your own version of zip  method. It should take two Arrays as arguments, 
and return a new Array (the original Arrays should not be changed). Do not use 
the built-in Array#zip method. You may assume that both input arrays have the 
same number of elements.
=end

=begin
  - create results array
  - Iterate through first array with its index
    - reference element at current index position and save to var2
    -create array with var1 and var2, then push to results array
=end

def zip(arr1, arr2)
  result = []
  arr1.each_with_index do |var1, idx|
    var2 = arr2[idx]
    result << [var1, var2]
  end

  result
end
zip([1, 2, 3], [4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]
