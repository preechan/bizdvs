class TradesController < ApplicationController
  before_action :set_trade, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @trades = Trade.all
    respond_with(@trades)
  end

  def show
    respond_with(@trade)
  end

  def new
    @trade = Trade.new
    respond_with(@trade)
  end

  def edit
  end

  def create
    @trade = Trade.new(trade_params)
    @trade.save
    respond_with(@trade)
  end

  def update
    @trade.update(trade_params)
    respond_with(@trade)
  end

  def destroy
    @trade.destroy
    respond_with(@trade)
  end

  private
    def set_trade
      @trade = Trade.find(params[:id])
    end

    def trade_params
      params.require(:trade).permit(:name)
    end
end
