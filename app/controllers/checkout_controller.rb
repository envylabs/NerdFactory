class CheckoutController < ApplicationController
  before_filter :authenticate_user!
  
  def show
  end

  def create
    if charge(current_user, current_order)
      current_order.destroy
      flash[:notice]  = 'Order has been successfully charged'
    else
      flash[:error]   = 'There has been a problem charging your credit card'
    end

    redirect_to checkout_url
  end
  
  
  private
  
  
  def charge(user, order)
    order.update_attribute(:user, user)
    OrderMailer.purchase_confirmation(order).deliver
    true
  end
  
end
