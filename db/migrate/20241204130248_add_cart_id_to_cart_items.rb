class AddCartIdToCartItems < ActiveRecord::Migration[7.2]
  def change
    add_column :cart_items, :cart_id, :integer
    add_column :cart_items, :quantity, :integer
  end
end
