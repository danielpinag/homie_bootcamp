require 'rails_helper'

RSpec.describe User, type: :model do
  it "is not valid without email" do
    expect(User.new(email: nil)).to_not be_valid
  end

  it "is valid with valid attributes" do
  expect(User.new(email: "johndoe@gmail.com", name: 'John', last_name: "Doe")).to be_valid
  end

  it "should have many rents" do
    user = User.reflect_on_association(:rents)
    expect(user.macro).to eq(:has_many)
  end

  it 'should have one owner' do
    user = User.reflect_on_association(:owner)
    expect(user.macro).to eq(:has_one)
  end
end
