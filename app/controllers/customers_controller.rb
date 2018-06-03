class CustomersController < ApplicationController
  def new
   @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)
    if @customer.save
      # After signing up customer goes to the main page:
      session[:customer_id] = @customer.id
	    redirect_to @customer
	    # After signing up customer goes to the customers#show page:
	    #redirect_to @customer
	  else
	    #render 'new'
      redirect_to '/signup'
	  end
  end

  def show

  end

  private
	  def customer_params
	    params.require(:customer).permit(:name, :email, :password)
	  end
end
