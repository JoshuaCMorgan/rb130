=begin
Write a method called one? that behaves similarly for Arrays. 
It should take an Array as an argument, and a block. It should 
return true if the block returns true for exactly one of the 
element values. Otherwise, it should return false.
=end

def one?(collection)
  false unless block_given?

  values = []
  collection.each do |element| 
    values << yield(element) 
  end
  
  if values.count(true) == 1 || values.count(false) == 1
    return true
  end 
  false
end

p one?([1, 3, 5, 6]) { |value| value.even? }    # -> true
p one?([1, 3, 5, 7]) { |value| value.odd? }     # -> false
p one?([2, 4, 6, 8]) { |value| value.even? }    # -> false
p one?([1, 3, 5, 7]) { |value| value % 5 == 0 } # -> true
p one?([1, 3, 5, 7]) { |value| true }           # -> false
p one?([1, 3, 5, 7]) { |value| false }          # -> false
p one?([]) { |value| true }                     # -> false