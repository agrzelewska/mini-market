class CustomersController < ApplicationController
  def new
   @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)
    if @customer.save
      # After signing up customer goes to the main page:
      session[:customer_id] = @customer_id
	  redirect_to '/'
	  # After signing up customer goes to the customers#show page:
	  #redirect_to @customer
	else
	  render 'new'
	end
  end

  private
	def customer_params
	  params.require(:customer).permit(:name, :email, :password_digest)
	end
end
