require 'rails_helper'

RSpec.describe Home, type: :model do
  owner = FactoryBot.create(:owner)

  it "is not valid without price" do
    expect(Home.new(price: nil)).to_not be_valid
  end

  it "total_price valid with valid attributes" do
    expect(Home.new(owner: owner, price: 12000.00, extra_service: 12000.00))
  end

  it "should have many rents" do
    home = Home.reflect_on_association(:rents)
    expect(home.macro).to eq(:has_many)
  end

  it 'should belong to owner' do
    home = Home.reflect_on_association(:owner)
    expect(home.macro).to eq(:belongs_to)
  end

  it "total_price is the same as price + extra_service" do
    home = Home.new(owner: owner, price: 12000.00, extra_service: 12000.00)
    expect(home.total_amount == home.price + home.extra_service)
  end
end
