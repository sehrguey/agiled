class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authorize
  private
  
  
  
  def current_cart 
    
    Cart.find(session[:cart_id])
                      
                      rescue ActiveRecord::RecordNotFound
                     
                     cart = Cart.create
                     
                     session[:cart_id] = cart.id
                     
                     cart
                     
                     end
		     
		     protected
		     
		     
		     
		     def authorize
		       if request.format == Mime::HTML 
			 
			 unless User.find_by_id(session[:user_id])
			                                
			                                redirect_to login_url, notice: "Please log in"
			                               
			                               end
			                               
			                               else
			                               
			                               authenticate_or_request_with_http_basic do |username, password|
			                               
			                               user = User.find_by_name(username)
			                               
			                               user && user.authenticate(password)
			                               
			                               end
			                               
			                               end
		     
		     end
end
