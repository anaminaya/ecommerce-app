class CartedProduct < ActiveRecord::Base
  belongs_to :user
  belongs_to :order
  belongs_to :product

  validates :quantity, presence: numericality: { only_integer: true }

end
