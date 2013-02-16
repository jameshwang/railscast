class Order < ActiveRecord::Base
  attr_accessible :canceled_at, :purchased_at, :shipped_at

  attr_accessor :invalid_payment

  scope :open_orders, -> { with_state(:open) }

  state_machine initial: :incomplete do
  	event :purchase do
  		transition :incomplete => :open
  	end

  	event :cancel do
  		transition :open => :canceled
  	end

  	event :resume do
  		transition :canceled => :open
  	end

  	event :ship do
  		transition :open => :shipped
  	end

  	before_transition :incomplete => :open do |order|
  		!order.invalid_payment
  	end
  end
end
