=begin
  if there is a second arguement, 'default' parameter will be set to value
    'omitted' would then be set to 'nil' value.
    effect: accumulator will be set to default
    effect: counter will be set to 1
  if no second argument, 'default' and 'omitted' are set to 'true'
    effect: accumulator will be set to first element
    effect: counter will be set to 0
=end

def reduce(collection, default = omitted = true)
  accumulator = omitted ? collection.first : default
  counter = omitted ? 1 : 0

  while counter < collection.size do
    accumulator = yield(accumulator, collection[counter])
    counter += 1
  end
  
  accumulator
end

array = [1, 2, 3, 4, 5]

p reduce(array) { |acc, num| acc + num }                    # => 15
p reduce(array, 1) { |acc, num| acc + num }                    # => 16
p reduce(array, 10) { |acc, num| acc + num }                # => 25
# p reduce(array) { |acc, num| acc + num if num.odd? }        # => NoMethodError: undefined method `+' for nil:NilClass
p reduce(['a', 'b', 'c']) { |acc, value| acc += value }     # => 'abc'
p reduce([[1, 2], ['a', 'b']]) { |acc, value| acc + value } # => [1, 2, 'a', 'b']