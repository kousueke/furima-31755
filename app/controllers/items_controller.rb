class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :new]

  def index
    #@items = Item.all
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
  end

  # def update
  # if current_user.update(user_params)
  # redirect_to root_path
  # else
  # render :edit
  # end
  # end

  def show
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

  def redirect_root
    redirect_to user_sessions_path unless user_signed_in?
  end
end
