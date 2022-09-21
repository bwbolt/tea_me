class Api::V1::TeasController < ApplicationController
  before_action :set_tea, only: %i[show update destroy]

  # GET /teas
  def index
    @teas = Tea.all

    render json: TeaSerializer.new(@teas)
  end

  # POST /teas
  def create
    @tea = Tea.new(tea_params)

    if @tea.save
      render json: TeaSerializer.new(@tea), status: :created
    else
      render json: @tea.errors, status: :unprocessable_entity
    end
  end

  private

  def set_tea
    @tea = Tea.find(params[:id])
  end

  def tea_params
    params.require(:tea).permit(:title, :description, :brew_details)
  end
end
