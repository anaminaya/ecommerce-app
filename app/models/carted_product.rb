class CartedProduct < ActiveRecord::Base
  belongs_to :users
  has_many :orders
  has_many :products, through: :orders			
end
