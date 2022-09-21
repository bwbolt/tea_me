class Api::V1::CustomersController < ApplicationController
  before_action :set_customer, only: %i[show]

  # GET /customers
  def index
    @customers = Customer.all

    render json: CustomerSerializer.new(@customers)
  end

  # GET /customer
  def show
    render json: @customer
  end

  # POST /customers
  def create
    @customer = Customer.new(customer_params)

    if @customer.save
      render json: CustomerSerializer.new(@customer), status: :created
    else
      render json: @customer.errors, status: :unprocessable_entity
    end
  end

  private

  def set_customer
    @customer = Customer.find(params[:id])
  end

  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :email, :address)
  end
end
