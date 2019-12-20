class Home
  include Mongoid::Document

  before_save :get_total_amount

  field :price, type: Float
  field :extra_service, type: Float
  field :total_amount, type: Float
  field :home_features, type: Hash, default: {garden: false, furnished: false, gym: false}

  validates_presence_of :price, :extra_service

  has_many :rents
  belongs_to :owner

  def get_total_amount
    self.total_amount = price + extra_service
  end
end