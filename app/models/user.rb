class User < ActiveRecord::Base
  has_secure_password
  has_many :carted_products
  has_many :orders

  validates :name, presence: true
  validates :email, presence: uniqueness: true
  validates :length min: 8
end
