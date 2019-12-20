require 'rails_helper'

RSpec.describe Owner, type: :model do
  user = FactoryBot.create(:user)
  home = FactoryBot.create(:home)

  it "is not valid without owner" do
  expect(Rent.new(user: nil, home: home)).to_not be_valid
  end

  it "is not valid without home" do
    expect(Rent.new(user: user, home: nil)).to_not be_valid
  end

  it "is valid with valid attributes" do
    expect(Rent.new(user: user, home: home)).to be_valid
  end

  it 'should belong to home' do
    rent = Rent.reflect_on_association(:home)
    expect(rent.macro).to eq(:belongs_to)
  end

  it 'should belong to user' do
    rent = Rent.reflect_on_association(:user)
    expect(rent.macro).to eq(:belongs_to)
  end
end
