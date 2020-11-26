=begin
Write a method that returns a list of all of the divisors of
the positive integer passed in as an argument. The return 
value can be in any sequence you wish.
=end



=begin
Best to think about this within context of relationship between
multiplication and divison. 
a * b = c == c / a = b
Weird fact is that square root of last num will give us 
no higher number than middle number.
So, we iterate 1 to square root, push to result (that's like 
saying we've figured out what a will be)
Now, to get b, we can divide c by a
=end

#mine
def divisors(number)
  sqr_root = Math.sqrt(number)

  result = []
  1.upto(sqr_root) do |num|
    if number % num == 0
      result << num 
      result << number/num
    end
  end

  result.uniq.sort
end


p divisors(1) == [1]
p divisors(7) == [1, 7]
p divisors(12) == [1, 2, 3, 4, 6, 12]
p divisors(98) == [1, 2, 7, 14, 49, 98]
p divisors(99400891) == [1, 9967, 9973, 99400891]