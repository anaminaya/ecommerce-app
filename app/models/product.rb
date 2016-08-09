class Product < ActiveRecord::Base
  belongs_to :supplier
  has_many :images
  has_many :category_products
  has_many :categories, through: :category_products
  has_many :carted_products
  has_many :products, through: :carted_products

  validates :name, presence: true
  validates :price, numericality: true
  validates :description, length: {maximum: 500}

  def sale_message
    if price.to_f < 2
      "Discount Item!"
    else
      "Not on Sale"
    end

  end

  def tax
  (price.to_f * 0.09).round(2)
  end

  def total
   (price.to_f + tax).round(2)
  end
end
