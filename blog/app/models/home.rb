class Home
  include Mongoid::Document
  field :price, type: Float
  field :extra_service, type: String
  field :total_amount, type: Float
  field :home_features, type: Hash, default: {garden: false, furnished: false, gym: false}
  validates :garden, :furnished, :gym, inclusion: { in: [ true, false ] }
  has_many :rent
  belongs_to :owner
end