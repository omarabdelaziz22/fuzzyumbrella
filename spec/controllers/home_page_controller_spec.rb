require 'rails_helper'

RSpec.describe HomePageController, type: :controller do
  before :each do
    User.destroy_all
    @user = User.create name: 'username', email: 'email@mail.com', password: '123456', password_confirmation: '123456'
  end
  describe "GET #home" do
    it "returns http success" do
      sign_in @user
      get :home
      expect(response).to have_http_status(:success)
    end
  end

end
