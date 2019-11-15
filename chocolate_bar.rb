def chocolate_bar(chocolate, day, month)
  ways_to_split = 0

  while chocolate.length >= month
    ways_to_split += 1 if chocolate.take(month).sum == day
    chocolate.shift
  end

  ways_to_split
end

chocolate = [12, 2, 3, 4]

puts chocolate_bar(chocolate, 7, 2)