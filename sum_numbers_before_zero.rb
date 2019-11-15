def sum_numbers_before_zero(numbers)
  position = 0

  while position < numbers.length
    number_before_zero = []
    numbers[position].to_s.reverse.each_char do |digit|
      break if digit == "0"
      number_before_zero.unshift(digit)
    end
    numbers[position] = number_before_zero.join.to_i
    position += 1
  end
  
  numbers.sum
end

numbers = [1200000265, 1000002360, 1670000800, 1000006002, 1000000233]

puts sum_numbers_before_zero(numbers)