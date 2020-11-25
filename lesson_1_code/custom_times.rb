class Integer

  def custom_times
    counter = 0

    while counter < self do 
      yield(counter) if block_given?
      counter += 1
    end

    self
  end
end

name = "Josh"

5.times do
  puts name
end

puts

5.custom_times do
  puts name
end

puts

5.custom_times do |num|
  puts num
end




