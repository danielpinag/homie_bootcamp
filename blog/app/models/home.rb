class Home
  include Mongoid::Document
  include Mongoid::Enum

  field :title, type: String
  field :price, type: Float

  has_many :rents
  has_one :outstanding
  has_one :listing
  belongs_to :owner, optional: true
end