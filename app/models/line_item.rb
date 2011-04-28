class LineItem < ActiveRecord::Base
  
  belongs_to :product
  belongs_to :order
  
  validates_presence_of :order_id
  validates_presence_of :product_id
  validates_numericality_of :quantity, :minimum => 1
  
  def price
    self.product.price * self.quantity
  end
  
end
