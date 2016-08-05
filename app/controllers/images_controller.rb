class ImagesController < ApplicationController
  def new
    render "new.html.erb"
  end

  def create
    image = Image.new(link: params[:link], product_id: params[:product][:product_id])
    image.save
    flash[:success] = "Your image was created!"
    redirect_to '/images/new'
  end
end
