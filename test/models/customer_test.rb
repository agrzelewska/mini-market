require 'test_helper'

class CustomerTest < ActiveSupport::TestCase
  
  def setup
    @customer = Customer.new(name: "Example Customer", email: "customer@example.com", password: "foobar")
  end

  test "should be valid" do
  	assert @customer.valid?
  end

  test "name should be present" do
  	@customer.name = "    "
  	assert_not @customer.valid?
  end

  test "email should be present" do
  	@customer.email = "    "
  	assert_not @customer.valid?
  end

  test "email validation should accept valid addresses" do
  	valid_addresses = %w(customer@example.com CUSTOMER@foo.COM A_US-ER@foo.bar.org first.last@foo.jp alice+bob@baz.cn)
  	valid_addresses.each do |valid_address|
  		@customer.email = valid_address
  		assert @customer.valid?, "#{valid_address.inspect} should be valid"
  	end
  end

  #test "email validation should reject invalid addresses" do
  #	invalid_addresses = %w[customer@example,com customer_at_foo.org customer.name@example. foo@bar_baz.com foo@bar+baz.com]
  #	invalid_addresses.each do |invalid_address|
  #		@customer.email = invalid_address
  #	end
  #end

  test "email addresses should be unique" do
  	duplicate_customer = @customer.dup
  	@customer.save
  	assert_not duplicate_customer.valid?
  end

  test "password should be present (nonblack)" do
  	@customer.password = " " * 6
  	assert_not @customer.valid?
  end

  test "password should have a minimum length" do
  	@customer.password = "a" * 5
  	assert_not@customer.valid?
  end

end
