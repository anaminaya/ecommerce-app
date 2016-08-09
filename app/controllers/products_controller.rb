class ProductsController < ApplicationController
  before_action :authorize_admin!, except: [:index, :show, :search]

  def index
    @products =Product.all
    #products is the controller I generated (always plural and lowercase)
    #Product is the model name which holds the attributes (always singular & 1st letter uppercase)
    if params[:sort]
      @products = Product.order(params[:sort])
    end
      if params[:sort_desc]
      @products = Product.order(params[sort: :desc])
    end

    if params[:discount] == "true"
      @products = Product.where("price < ?", 15)
    end

    if params[:category]
      category = Category.find_by(name: params[:category])
      @products = category.products
    end
  end

  def show
    if params[:id] == "random"
    @products = Product.all.sample

    else
      @products = Product.find_by(id: params[:id])
    end

    @supplier = @products.supplier

  end

  def new
    @products = Product.new
      render "new.html.com"
  end

  def create
    @products = Product.new(
    name:params[:name],
    description:params[:description],
    price:params[:price],
    )

    if @products.valid?
      flash[:success]= "Product successfully created"
      redirect_to "/products/#{@products.id}"
    else
      flash[:danger]= "Product was invalid"
      render "new.html.erb"
    end
  end

  def edit
    @products = Product.find_by(id: params[:id])
  end

  def update

    @products = Product.find_by(id: params[:id])
    @products.update(
    name:params[:name],
    description:params[:description],
    price:params[:price],
    )

    flash[:success]= "Product successfully updated"
    redirect_to "/products/#{@products.id}"
  end

  def destroy
    @products = Product.find_by(id: params[:id])
    @products.destroy
    flash[:danger]= " Product was successfully destroyed"
    redirect_to '/products'
  end

  def search
    @products = Product.where("LOWER(name) LIKE ?", "%#{params[:search].downcase}%")
    render "index.html.rb"
  end

end
