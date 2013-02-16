require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  context "just a truth test" do
  	should "be true" do
  		assert true
  	end

  	should "be pending"
  end

  context "testing the state machine" do
  	setup do
  		@o = Order.create
  	end

  	should "move from incomplete to open by the user purchasing" do
  		@o.purchase
  		assert @o.open?
  		assert !@o.incomplete?
  	end

  	should "only be allowed to "
  end
end
