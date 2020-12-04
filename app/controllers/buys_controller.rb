class BuysController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @user_settlement = UserSettlement.new
     unless user_signed_in?
      redirect_to root_path
     end
     if user_signed_in? && current_user.id == @item.user_id
      redirect_to root_path
     end
  end

  def create
    @item = Item.find(params[:item_id])
    @user_settlement = UserSettlement.new(buy_params)
    if @user_settlement.valid?
      pay_item
      @user_settlement.save
      return redirect_to root_path
    else
      render :index
    end
  end

  private

  def buy_params
    params.require(:user_settlement).permit(:postalcode, :area_id, :municipality, :address, :buildingname, :tell, :user_id, :item_id).merge(token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: user_settlement_params[:user_id, :item_id],
      card: user_settlement_params[:token],
      currency: 'jpy'
    )
  end
  
end