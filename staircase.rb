def staircase(height)
  for row in (1..height)
    puts " " * (height - row) + "#" * row
  end
end

staircase(30)