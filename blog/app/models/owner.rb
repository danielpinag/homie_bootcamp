class Owner
  include Mongoid::Document

  field :curp, type: String
  field :registered_in_srpago, type: Boolean

  validates_presence_of :curp
  validates_uniqueness_of :curp

  has_many :homes
  belongs_to :user
end