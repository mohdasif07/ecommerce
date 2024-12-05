class RenameCartItemsToOrderItems < ActiveRecord::Migration[7.2]
  def change
    rename_table :cart_items, :order_items
  end
end
