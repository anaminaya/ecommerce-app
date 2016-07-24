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
    render "create.html.erb"
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

    render "update.html.erb"
  end

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

end
