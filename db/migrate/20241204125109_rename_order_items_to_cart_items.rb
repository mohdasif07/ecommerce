class RenameOrderItemsToCartItems < ActiveRecord::Migration[7.2]
  def change
    rename_table :order_items, :cart_items
  end
end
