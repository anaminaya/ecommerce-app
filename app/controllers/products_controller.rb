class ProductsController < ApplicationController

  def index
    @products =Product.all
    #products is the controller I generated (always plural and lowercase)
    #Product is the model name which holds the attributes (always singular & 1st letter uppercase)
  end

  def show
    @products = Product.find_by(id: params[:id])
    render "show.html.erb"
  end

  def new
    render "new.html.erb"
  end

  def create
    @products = Product.new(
    name:params[:name],
    price:params[:price],
    image:params[:image],
    description:params[:description]
    )
    @products.save
    flash[:success]= "#{@products.description} was successfully created"
    redirect_to "/products/#{@products.id}"
  end

  def edit
    @products = Product.find_by(id: params[:id])
    render "edit.html.erb"
  end

  def update
    @products = Product.find_by(id: params[:id])
    @products.update(
    name:params[:name],
    price:params[:price],
    image:params[:image],
    description:params[:description]
    )

    flash[:success]= "#{@products.description} was successfully updated"
    redirect_to "/products/#{@products.id}"
  end

  def destroy
    @products = Product.find_by(id: params[:id])
    @products.destroy
    flash[:danger]= "#{@products.description} was successfully destroyed"
    redirect_to "/products"
  end

=begin
  def new_form
    render "new_form.html.erb"
  end

  def new_product
  Product.create(
    name:params[:name],
    price:params[:price],
    image:params[:image],
    description:params[:description]
    )
     render "new_form.html.erb"
  end
=end

end
