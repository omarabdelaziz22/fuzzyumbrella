class HomePageController < ApplicationController
  def home
    if user_signed_in?
      redirect_to products_path
    else
      redirect_to new_user_registration_path
    end
  end
end
