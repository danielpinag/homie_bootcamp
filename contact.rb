class Contact

  def self.all
    [{age: 20, name: "José", last_name: "López", gender: :male},
    {age: 21, name: "Oscar", last_name: "Pérez", gender: :male},
    {age: 22, name: "Martha", last_name: "Sánchez", gender: :female}]
  end

  def self.find_by(attribute, value)
    self.all.each do |contact|
      next unless contact[attribute] == value
      print contact
      return
    end
    raise "No hay ningún contacto con esas características"
  end
end
puts Contact.all
puts Contact.find_by(:age, 22)