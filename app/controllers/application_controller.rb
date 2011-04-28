# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  layout 'application'
  
  helper_method :current_order
  
  
  protected
  
  
  def current_order
    @current_order ||= begin
      Order.find_by_id(session[:order_id]) ||
      Order.create!.tap { |order| session[:order_id] = order.id }
    end
  end
  
end
