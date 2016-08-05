class CreateImageColumn < ActiveRecord::Migration
  def change
    create_table :image_columns do |t|
      t.string :link
      t.integer :product_id
    end
  end
end
