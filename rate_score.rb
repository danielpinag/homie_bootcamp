def rate_score(validations, score)
  validations.each do |validation, result|
    return result if score < validation
  end
end

way_to_rate = {
  0 => "sin fico",
  10 => "con poco fico", 
  20 => "con fico regular"
}

puts rate_score(way_to_rate, 13)