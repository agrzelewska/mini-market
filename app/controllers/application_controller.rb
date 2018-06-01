class ApplicationController < ActionController::Base
	helper_method :current_customer

	def current_customer
		@current_customer ||= Customer.find(session[:customer_id]) if session[:customer_id]
	end

end
