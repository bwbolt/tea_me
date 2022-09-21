class Api::V1::SubscriptionsController < ApplicationController
  before_action :set_subscription, only: [:destroy]

  def create
    customer = Customer.find(params[:customer_id])
    @subscription = customer.subscriptions.find_by(tea_id: params[:tea_id])

    if @subscription.nil?

      @subscription = Subscription.new(subscription_params)

      if @subscription.save
        render json: SubscriptionSerializer.new(@subscription), status: :created
      else
        render json: @subscription.errors, status: :unprocessable_entity
      end

    else
      @subscription[:active] = 'Active'
      @subscription.save
      render json: SubscriptionSerializer.new(@subscription), status: :accepted
    end
  end

  def destroy
    @subscription[:active] = 'Inactive'
    @subscription.save
    render json: SubscriptionSerializer.new(@subscription), status: :accepted
  end

  private

  def set_subscription
    @subscription = Subscription.find(params[:id])
  end

  def subscription_params
    params.require(:subscription).permit(:frequency, :customer_id, :tea_id)
  end
end
