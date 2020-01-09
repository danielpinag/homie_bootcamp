class Home
  include Mongoid::Document
  include Mongoid::Enum

  before_save :set_total_amount

  field :price, type: Float
  field :extra_service, type: Float
  field :total_amount, type: Float
  field :home_features, type: Hash, default: {garden: false, furnished: false, gym: false}
  field :location, type: Array
  field :master_home_id, type: String, default: nil
  enum :status, [:in_progress, :published, :rented]

  validates_presence_of :price, :extra_service

  has_many :rents
  belongs_to :owner

  def set_total_amount
    self.total_amount = price + extra_service
  end
end