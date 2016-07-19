class ProductsController < ApplicationController
  def product
    @products =Product.all
    #products is the controller I generated (always plural and lowercase)
    #Product is the model name which holds the attributes (always singular & 1st letter uppercase)
  end
end
