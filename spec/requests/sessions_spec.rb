require 'rails_helper'

RSpec.describe "Sessions" do

  it 'is database authenticable' do
    user = User.create(
       email: 'test@example.com', 
      password: 'password123',
      password_confirmation: 'password123'
    )
    expect(user.valid_password?('password123')).to be_truthy
  end
  
  it "signs user in and out" do
    user = User.create!(email: "user@example.org", password: "very-secret")
    
    sign_in user
    get root_path
    
    sign_out user
    get root_path
  end
end