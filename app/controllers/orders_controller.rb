class OrdersController < ApplicationController
  def create
    @order = Order.new(
    quantity: params[:quantity],
    product_id: params[:product_id],
    user_id: current_user.id)

    order.subtotal = params[:quantity]* order.product.price
    order.tax = 0.09 * order.subtotal
    order.total= order.subtotal + order.tax

    @order.save

    redirect_to "/orders/#{@order.id}"
  end

  def show
    @order = Order.find_by(id: params[:id])
    @product = @order.product
    @image = @image.product.link.first
      flash[:success]= "#{@order.description} Order successful"
      redirect_to "/orders/#{@order.id}"
  end

end
