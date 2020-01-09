class SimilarHome
  include Mongoid::Document
  include Mongoid::Enum

  def self.search
    published_homes_attributes = Home.pluck(:owner, :total_amount, :location, :home_master_id).uniq

    published_homes_attributes.each do |attributes|
      homes = Home.published.where(
        owner: attributes[0],
        total_amount: attributes[1],
        location: attributes[2],
        home_master_id: attributes[3]
      )

      next unless homes.count > 1
      homes.each do |home|
        puts "#{home.owner.user.full_name}, #{home.owner.user.email},#{home.id}, #{home.total_amount}, #{home.status}, #{home.location}"
      end
    end
  end
end
