class Order < ActiveRecord::Base
  
  has_many :line_items
  has_many :products, :through => :line_items
  belongs_to :user
  
  def add(product)
    return if self.products.include?(product)
    self.line_items.create!(:product => product, :quantity => 1)
  end
  
  def set_quantity(product, quantity)
    return unless self.products.include?(product)
    if quantity <= 0
      line_item_of(product).destroy
    else
      line_item_of(product).update_attributes(:quantity => quantity)
    end
  end
  
  def remove(product)
    return unless self.products.include?(product)
    line_item_of(product).destroy
  end
  
  def price
    self.line_items.inject(0) { |sum, item| sum += item.price }
  end
  
  
  private
  
  
  def line_item_of(product)
    self.line_items.find_by_product_id(product.id)
  end
  
end
