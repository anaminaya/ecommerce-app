class CartedProductsController < ApplicationController
before_action :authenticate_user!


  def index
    @carts = CartedProduct.where(status: 'carted', user_id: current_user.id)

    if @carts.empty?
      flash[:info] = "Your cart is empty. Check out some of these products!"
      redirect_to '/products'
    end

    render "index.html.erb"

  end

  def create
    @cart = CartedProduct.create(
    quantity: params[:quantity],
    product_id: params[:product_id],
    user_id: current_user.id,
    status: "carted")

    redirect_to '/shoppingcart'
  end


  def destroy
    cart = CartedProduct.find_by(id: params[:id])
    cart.update(status: 'removed')
    flash[:success] = "Your#{cart.product.name} was removed from your cart."
    redirect_to '/shoppingcart'
    
  end


end
