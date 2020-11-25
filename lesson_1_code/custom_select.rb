class Array

  def custom_select
    idx = 0
    array = Array.new([])
    
    while idx < self.size  do
      break unless block_given?
      array << self[idx] if yield(self[idx])
      idx += 1
    end

    array
  end

end


array = [1, 2, 3, 4, 5]

array.select { |num| num.odd? }
array.select { |num| puts num }
array.select { |num| num + 1 }

array.custom_select { |num| num.odd? }
array.custom_select { |num| puts num }
array.custom_select { |num| num + 1 }