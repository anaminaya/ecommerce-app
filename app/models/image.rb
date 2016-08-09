class Image < ActiveRecord::Base
  belongs_to :product
  validates :link, presence: true
end
