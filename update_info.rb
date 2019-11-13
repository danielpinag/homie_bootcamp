data = {
  enterprise: 'Homie',
  years: 4
}

def update_info(data, key, value)
  data[key] = value
  data
end

puts update_info(data, :enterprise, "Google")