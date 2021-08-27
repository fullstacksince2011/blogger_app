require 'rails_helper'
RSpec.describe PostsController, :type => :controller do

  describe "POST create" do
    it 'should create contact successfully' do
      user = User.create!(email: "user@example.org", password: "very-secret")
      sign_in user
      post :create, params: { post: { title: "Test", body: "trtr", user_id: user.id } }
      expect(response.status).to eq(302)
      expect(response).to redirect_to(root_path)
    end
  end

  describe "POST Update" do
    it 'should update successfully' do
      user = User.create!(email: "user@example.org", password: "very-secret")
      post = Post.create!(title: "Test", body: "trtr", user_id: user.id)
      sign_in user
      put :update, params: { id: post.id, post: { title: "Test update", body: "trtr", user_id: user.id } }
      expect(response.status).to eq(302)
      expect(response).to redirect_to(root_path)
    end
  end

end