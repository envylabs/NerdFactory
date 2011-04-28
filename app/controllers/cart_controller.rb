class CartController < ApplicationController
  
  def show
  end
  
  def create
    product = Product.find(params[:product_id])
    current_order.add(product)
    redirect_to cart_url
  end
  
  def update
    product = current_order.products.find(params[:product_id])
    current_order.set_quantity(product, params[:quantity].to_i)
    respond_to do |format|
      format.html { redirect_to cart_url }
      format.js
    end
  end
  
  def destroy
    product = Product.find(params[:product_id])
    current_order.remove(product)
    redirect_to cart_url
  end
  
  
  private
  
  
  def cart
  end
  
end
