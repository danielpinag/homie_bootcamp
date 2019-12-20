require 'rails_helper'

RSpec.describe Owner, type: :model do
  user = FactoryBot.create(:user)

  it "is not valid without user" do
    expect(Owner.new(user: nil)).to_not be_valid
  end

  it "is valid with valid attributes" do
    expect(Owner.new(
        user: user,
        curp: FFaker::IdentificationMX.curp,
        registered_in_srpago: FFaker::Boolean.random)
    ).to be_valid
  end

  it "should have many homes" do
    owner = Owner.reflect_on_association(:homes)
    expect(owner.macro).to eq(:has_many)
  end

  it 'should belong to user' do
    owner = Owner.reflect_on_association(:user)
    expect(owner.macro).to eq(:belongs_to)
  end
end