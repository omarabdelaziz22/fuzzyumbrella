class FavoritelistsController < ApplicationController
  before_action :set_favoritelist
  before_action :authorize_user

  def show
    @products = @favoritelist.products
  end

  def favorite
    @product = Product.find(params[:product_id])
    print "inside favorite method"
    type = params[:type]
    print "Type:::::"
    print type
    print "          "
    print "product::::::"
    print @product
    if type == "favorite"
      current_user.favoritelist.products << @product
      print "          >>>>>>>>   "
      print current_user.favoritelist.products
      print "          "
      redirect_to product_path(@product)
    else type == "unfavorite"
      current_user.favoritelist.products.delete(@product)
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_favoritelist
      @favoritelist = current_user.favoritelist || current_user.create_favoritelist
    end

    def authorize_user
      unless @favoritelist.user.id == current_user.id
        redirect_to root_path
      end
    end
end
