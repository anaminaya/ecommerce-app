class OrdersController < ApplicationController
before_action :authenticate_user!

  def create
    @order = Order.create(
    user_id: current_user.id)
    @carts = CartedProduct.where(status: 'carted', user_id: current_user.id)


    subtotal = 0

   @carts.each do |item|
     subtotal += item.product.price * item.quantity
     item.update(order_id: @order.id)
   end

   tax = subtotal * 0.09
   total = subtotal + tax

   @order.update(
   subtotal: subtotal,
   tax: tax,
   total: total
   )

   @carts.update_all(order_id: @order.id, status: 'purchased')

    redirect_to "/orders/#{@order.id}"
  end

  def show

    @order = Order.find_by(id: params[:id])
      if @order.user.id == current_user.id
        @carts = @order.carted_products

      else
        redirect_to '/products'
      end
    end
  end
