class Rent
  include Mongoid::Document

  enum :status, [:started, :finished, :cancelled]

  belongs_to :user
  belongs_to :home
end