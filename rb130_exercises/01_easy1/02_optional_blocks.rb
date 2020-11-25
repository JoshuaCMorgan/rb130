=begin
Write a method that takes an optional block. 
If the block is specified, the method should execute it, 
and return the value returned by the block. 
If no block is specified, the method should simply return 
the String 'Does not compute.'.
=end

def compute
  return "Does not compute." unless block_given?
  yield
end

# Examples:
p compute { 5 + 3 } == 8
p compute { 'a' + 'b' } == 'ab'
p compute == 'Does not compute.'

=begin
Further Exploration:
Modify the compute method so it takes a single argument 
and yields that argument to the block. 
Provide at least 3 examples of calling this new version of compute, 
including a no-block call.
=end

def compute2(param)
  return "Does not compute." unless block_given?
  yield(param)
end

p compute2(5) { |num| num + 3 } == 8
p compute2('a') { |str| str + 'b' } == 'ab'
p compute2(nil) == 'Does not compute.'
