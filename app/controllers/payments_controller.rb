class PaymentsController < ApplicationController
  before_action :set_deal

  def new
  end

  def create
    customer = Stripe::Customer.create(
      source: params[:stripeToken],
      email:  params[:stripeEmail]
    )

    charge = Stripe::Charge.create(
      customer:     customer.id,
      amount:       @deal.amount_cents,
      description:  "Payment for deal #{@deal.id} from exs",
      currency:     @deal.amount.currency
    )

    @deal.update(payment: charge.to_json, state: 'paid')
    redirect_to deal_path(@deal)

    rescue Stripe::CardError => e
      flash[:alert] = e.message
      redirect_to new_deal_payment_path(@deal)
  end

   private

  def set_deal
    @deal = Deal.where(state: 'pending').find(params[:deal_id])
  end

end
