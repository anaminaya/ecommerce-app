class CartedProductsController < ApplicationController
  def create
    @cart = CartedProduct.create(
    quantity: params[:quantity],
    product_id: params[:product_id],
    user_id: current_user.id,
    status: "carted")

    redirect_to '/shoppingcart'
  end

  def index
    @cart = CartedProduct.where(status: 'carted', user_id: current_user.id)

    render "index.html.erb"

  end


end
