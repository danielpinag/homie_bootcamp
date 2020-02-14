class ListingProvider
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Enum

  PROVIDERS = {
    mercado_libre: 'mercado_libre'
  }

  field :name, type: String

  index( { name:1 } )

  scope :mercado_libre, -> { where(name: PROVIDERS[:mercado_libre]) }

  has_one :outstanding
end