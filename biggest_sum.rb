def biggest_sum(array)
  sums = []

  array.each do |row|
    sums.push(row.sum)
  end
  array.transpose.each do |column|
    sums.push(column.sum)
  end

  sums.max
end

a =
[
  [3, 2, 7, 39, 0, 1],
  [6, 4, 5, 67, 15, 2],
  [9, 9, -2, -202, -21, -7],
  [1, 2, 3, 123, -12, 12],
  [4, 5, 6, 55, 54, -67],
  [7, 8, 9, 0, -58, 70]
]

puts biggest_sum(a)