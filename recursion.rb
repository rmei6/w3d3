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
    return middle + index + 1 #+1 is important because new array starts from 0 instead of 1
  elsif check_num > target
    return bsearch(array[0...middle],target)
  end
end

def merge(arr1, arr2)
  comb = arr1+arr2
  comb.sort
end


def merge_sort(arr)
  return arr if arr.length == 1 || arr.length == 0
  middle = arr.length/2
  merge(merge_sort(arr[0...middle]), merge_sort(arr[middle..-1]))
end

p merge_sort([38,27,43,3,9,82,10])

