class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:edit, :update, :show, :destroy]
  before_action :set_item2, only: [:edit, :destroy]

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
    @item.destroy
    redirect_to root_path
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  def show
    @comment = Comment.new
    @comments = @item.comments.includes(:user)
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

  def set_item
    @item = Item.find(params[:id])
  end

  def set_item2
    redirect_to root_path unless current_user.id == @item.user_id
  end
end
