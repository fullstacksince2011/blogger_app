require 'rails_helper'
RSpec.describe Post, type: :model do
  it "can be instantiated" do
    expect(Post.new).to be_an_instance_of(Post)
  end

  let (:user) { User.create(email: "user@example.org", password: "very-secret")}
  let (:post) { Post.create(title: "New Post", body: "Description", user_id: user.id)}
  it "should be saved successfully" do
    expect(post.present?).to be_truthy
    User.delete_all
    Post.delete_all
  end

  it 'Create post' do
    user = User.create!(email: "user@example.org", password: "very-secret")
    expect(user.present?).to be_truthy
  end
  
end