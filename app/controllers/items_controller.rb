class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  def index
    @items = Item.all.includes(:user).order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    item = Item.find(params[:id])
    item.update(item_params)
    if item.save
      redirect_to show
    else
      render :edit
    end
    # if current_user.update(user_params)
    #  redirect_to root_path
    # else
    #  render :edit
    # end
  end

  def show
    @item = Item.find(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(
      :image, :name, :explanation, :category_id, :status_id, :deli_price_id, :area_id, :deli_day_id, :price
    ).merge(user_id: current_user.id)
  end

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
