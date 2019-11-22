class User

  def initialize(name, last_name)
    @name = name
    @last_name = last_name
  end

  def full_name
    "#{@name} #{@last_name}"
  end
end

daniel = User.new("Daniel", "Piña")

puts daniel.full_name