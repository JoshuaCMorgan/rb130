class Array

  def custom_each
    idx = 0
    while idx < self.size 
      yield(self[idx]) if block_given?
      idx += 1
    end

    self
  end

end

arr = [1, 2, 3]

arr.each do |num|
  puts num 
end 

arr.custom_each do |num|
  puts num 
end 

