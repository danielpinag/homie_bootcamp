class Home::Listing
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Enum

  field :publish_xml_or_response, type: String
  field :listing_name, type: String

  belongs_to :home, index: true

  MERCADO_LIBRE_TYPES = Outstanding::MERCADO_LIBRE_TYPES

  def self.sort
    listings = {}

    MERCADO_LIBRE_TYPES.each do |type|
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
    should_not_been_sent = []
    should_been_sent = []

    homes_id.each do |home_id|
      outstanding = Home::Listing::Outstanding.find_by(home_id: home_id)
      listing = Home::Listing.find_by(home_id: home_id)

      next if listing.publish_xml_or_response =~ /#{outstanding.outstanding_type},/

      if MERCADO_LIBRE_TYPES.any? { |type| listing.publish_xml_or_response.include? "#{type}," }
        should_not_been_sent.push(listing.id.to_s)
      else
        should_been_sent.push(listing.id.to_s)
      end
    end
    puts "Los que no se debieron enviar como Gold Premium y Gold pero se enviaron de esa manera son #{should_not_been_sent}"
    puts "Los que se debieron enviar como Gold Premium y Gold pero no se enviaron de esa manera son #{should_been_sent}"
  end
end