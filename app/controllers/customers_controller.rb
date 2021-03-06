class CustomersController < ApplicationController
  def new
    @customer = Customer.new
  end

  def create
    customer = Customer.new(params)
    if customer.save
      session[:customer_id] = customer.id
      redirect_to customer
    else
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
