class Rent
  include Mongoid::Document
  belongs_to :user
  belongs_to :home
end