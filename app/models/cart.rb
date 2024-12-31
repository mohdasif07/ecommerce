class Cart < ApplicationRecord
  belongs_to :user
  has_many :order_items, dependent: :destroy
  has_many :products, through: :order_items
  has_many :cart_items

  def set_cart
    @cart = current_user.cart || current_user.create_cart(status: 'in_progress')
  end

  def add_item(product_id)
    item = cart_items.where('product_id = ?', product_id).first
    if item
      item.quantity += 1
      item.save
    else
      # Create a new order item if it doesn't exist
      cart_items.create(product_id: product_id, quantity: 1)
    end
  end

  def total_price
    cart_items.sum { |item| item.total_price }
  end
end

