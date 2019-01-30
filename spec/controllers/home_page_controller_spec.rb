require 'rails_helper'

RSpec.describe HomePageController, type: :controller do
  before :each do
    User.destroy_all
    @user = User.create name: 'username', email: 'email@mail.com', password: '123456', password_confirmation: '123456'
  end
  describe "GET #home" do
    it "Redirect to Product_path if user sign in" do
      sign_in @user
      get :home
      expect(response).to redirect_to products_path
    end
  end
  describe "GET #home" do
    it "Redirect to new_user_registration_path if user not sign in" do
      get :home
      expect(response).to redirect_to new_user_registration_path
    end
  end
end
