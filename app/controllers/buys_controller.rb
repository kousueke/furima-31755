class BuysController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @user_settlement = UserSettlement.new
    redirect_to root_path unless user_signed_in?
    redirect_to root_path if user_signed_in? && current_user.id == @item.user_id
  end

  def create
    @item = Item.find(params[:item_id])
    @user_settlement = UserSettlement.new(buy_params)
    if @user_settlement.valid?
      pay_item
      @user_settlement.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def buy_params
    params.require(:user_settlement).permit(:postalcode, :area_id, :municipality, :address, :buildingname, :tell).merge(token: params[:token], user_id: current_user.id, item_id: params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: params[:token],
      currency: 'jpy'
    )
  end
end
