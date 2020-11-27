=begin
Write a method called all? that behaves similarly for Arrays. It should take 
an Array as an argument, and a block. It should return true if the block 
returns true for all of the element values. Otherwise, it should return false.
=end

=begin
unless block given, return false

- iterate through collection 
  - yield argument to block
  - unless return value of block is true, return false
-return true
=end

def all?(collection)
  return false unless block_given?

  collection.each { |value| return false unless yield(value) }
  true
end 

p all?([1, 3, 5, 6]) { |value| value.odd? } == false
p all?([2, 4, 6, 8]) { |value| value.even? } == true
p all?([1, 3, 5, 7]) { |value| value % 5 == 0 } == false
p all?([1, 3, 5, 7]) { |value| value.odd? } == true
p all?([1, 3, 5, 7]) { |value| true } == true
p all?([1, 3, 5, 7]) { |value| false } == false
p all?([]) { |value| false } == true