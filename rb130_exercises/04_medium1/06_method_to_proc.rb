=begin
fill in the missing part of the following code so we can convert an array 
of integers to base 8 (octal numbers). Use the comments for help in 
determining where to make your modifications, and make sure to review the 
"Approach/Algorithm" section for this exercise; it should prove useful.

def convert_to_base_8(n)
  n.method_name.method_name # replace these two method calls
end

# The correct type of argument must be used below
base8_proc = method(argument).to_proc

# We'll need a Proc object to make this code work. Replace `a_proc`
# with the correct object
[8, 10, 12, 14, 16, 33].map(&a_proc)
=end

=begin
  convert integer into the String representation of a base-8 number
  convert the return value to an integer.
    ex: 8.to_s(8), 10.to_s(8), 12.to_s(8) and so on
=end

def convert_to_base_8(n)
  n.to_s(8).to_i
end


base8_proc = method(:convert_to_base_8).to_proc

[8, 10, 12, 14, 16, 33].map(&base8_proc)
# [10, 12, 14, 16, 20, 41]