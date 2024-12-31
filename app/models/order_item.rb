class OrderItem < ApplicationRecord
  self.table_name = 'order_items'
  belongs_to :order, optional: true
  belongs_to :product
  belongs_to :cart
  
  validates :quantity, presence: true, numericality: { greater_than: 0 }
def total_price
    quantity * price
  end
end
