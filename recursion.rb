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
    # return self unless self.is_a?(Array)

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


robot_parts = [
  ["nuts", "bolts", "washers"],
  ["capacitors", "resistors", "inductors"]
]

robot_parts_copy = robot_parts.deep_dup

# shouldn't modify robot_parts
robot_parts_copy[1] << "LEDs"
# but it does
p robot_parts[1] # => ["capacitors", "resistors", "inductors", "LEDs"]
p robot_parts_copy[1]
