class PaymentsController < ApplicationController

  def stripe
    # Amount in cents
    @amount = params[:amount]

    customer = Stripe::Customer.create(
      :email => 'example@stripe.com',
      :card  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => 'Rails Stripe customer',
      :currency    => 'usd'
    )

    redirect_to items_path

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to items_path
  end

end