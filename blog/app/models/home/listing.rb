class Home::Listing
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Enum

  field :publish_xml_or_response, type: String
  field :listing_name, type: String

  belongs_to :home, index: true

  def self.sort
    listings = {}

    Outstanding::MERCADO_LIBRE_TYPES.each do |type|
      listings[type] = {home_ids: [], total: 0}
      where(publish_xml_or_response: /#{type},/).each do |listing|
        listings[type][:home_ids].push(listing.id.to_s)
      end
      listings[type][:total] = listings[type][:home_ids].count
    end

    listings[:silver] = {home_ids: [], total: 0}
    where(publish_xml_or_response: /:silver,/).each do |listing|
      listings[:silver][:home_ids].push(listing.id.to_s)
    end
    listings[:silver][:total] = listings[:silver][:home_ids].count

    listings
  end

  def self.different_to_outstanding
    homes_id = Home.pluck(:id)
    one = []
    two = []

    homes_id.each do |home_id|
      outstanding = Home::Listing::Outstanding.find_by(home_id: home_id)
      listing = Home::Listing.find_by(home_id: home_id)

      next if listing.publish_xml_or_response =~ /#{outstanding.outstanding_type},/

      if listing.publish_xml_or_response =~ /:gold,/ || listing.publish_xml_or_response =~ /:gold_premium,/
        one.push(listing.id.to_s)
      else
        two.push(listing.id.to_s)
      end
    end
    puts "Los que no se debieron enviar como Gold Premium y Gold pero se enviaron de esa manera son #{one}"
    puts "Los que se debieron enviar como Gold Premium y Gold pero no se enviaron de  esa manera son #{two}"
  end
end