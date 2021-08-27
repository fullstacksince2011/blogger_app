require 'rails_helper'

RSpec.describe User, type: :model do
  it "can be instantiated" do
    User.new.should be_an_instance_of(User)
  end

  it 'Create user' do
    user = User.create!(email: "user@example.org", password: "very-secret")
    expect(user.present?).to be_truthy
  end
  
end