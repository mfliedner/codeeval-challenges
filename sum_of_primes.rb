# This extension checks whether a natural number is prime
class Fixnum
  def is_prime?
    return false if self < 2
    return true if self < 4
    high = Math.sqrt(self).floor
    (2..high).each { |div| return false if self%div == 0 }
    true
  end
end

# This script sums the first 1000 prime numbers
count = 1
sum = 2
number = 3
while count < 1000
  if number.is_prime?
    sum += number
    count += 1
  end
  number += 1
end
puts sum
