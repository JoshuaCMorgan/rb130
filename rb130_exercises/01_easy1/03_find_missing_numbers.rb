=begin
Write a method that takes a sorted array of integers as an argument, and
returns an array that includes all of the missing integers (in order) between the first and last elements of the argument.
=end


#mine
def missing(array)
  (array.first..array.last).to_a - array
end

#LS
def missing(array)
  result = []
  array.each_cons(2) do |first, second|
    result.concat(((first + 1)..(second - 1)).to_a)
  end
  result
end


p missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
p missing([1, 2, 3, 4]) == []
p missing([1, 5]) == [2, 3, 4]
p missing([6]) == []