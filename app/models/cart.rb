class Cart < ApplicationRecord
  belongs_to :user
  has_many :order_items
  has_many :products , through: :order_items

  def set_cart
    @cart = current_user.cart ||current_user.create_cart(status: 'in_progress')
  end
  
end
