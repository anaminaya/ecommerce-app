class Order < ActiveRecord::Base
  belongs_to :user
  has_many :carted_products
  has_many :products, through: :carted_products

  validates :subtotal, presence: numericality: true
  validates :tax, presence: numericality: true
  validates :total, presence: numericality: true
end
