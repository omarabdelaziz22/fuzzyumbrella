class CreateJoinTableProductsFavoritelists < ActiveRecord::Migration[5.2]
  def change
    create_join_table :products, :favoritelists do |t|
      t.index [:product_id, :favoritelist_id]
      t.index [:favoritelist_id, :product_id]
    end
  end
end
