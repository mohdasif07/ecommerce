class AddCartItemIdToOrderItems < ActiveRecord::Migration[7.2]
  def change
    add_column :order_items, :cart_item_id, :integer
  end
end
