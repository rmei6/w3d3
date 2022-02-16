def range(start,end_n)
  return [] if end_n <= start
  [start] + range(start+1,end_n)
end

def exp_1(num,exponent)
  return 1 if exponent == 0
  num * exp_1(num, exponent-1)
end

def exp_2(num,exponent)
  return 1 if exponent == 0
  return num if exponent == 1
  if exponent.even?
    return exp_2(num, exponent/2) ** 2
  else
    return num * (exp_2(num, exponent-1) ** 2)
  end
end

class Array

  def deep_dup
    new_arr = []
    self.each do |ele|
      if !ele.is_a?(Array)
        new_arr << ele
      else
        new_arr << ele.deep_dup
      end
    end
    new_arr
  end

end

def fibonacci(n)
  return [1] if n == 1
  return [1,1] if n == 2

  prev = fibonacci(n-1)
  last = prev[-1]
  second_last = prev[-2]
  prev << last + second_last
end

def bsearch(array,target)
  return nil if array.empty?
  middle = array.length / 2
  check_num = array[middle]
  return middle if check_num == target
  if check_num < target
    index = bsearch(array[middle+1..-1],target)
    return index if index == nil
    return middle + index + 1
  elsif check_num > target
    return bsearch(array[0...middle],target)
  end
end


