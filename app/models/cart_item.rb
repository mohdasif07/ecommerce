class CartItem < ApplicationRecord
  self.table_name = 'cart_items'
  belongs_to :order
  belongs_to :product
  belongs_to :cart
end
