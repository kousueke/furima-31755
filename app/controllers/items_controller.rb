class ItemsController < ApplicationController
  before_action :redirect_root, except: :new
  before_action :authenticate_user!, except: :index


  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end
  #- ログイン状態のユーザーだけが、商品出品ページへ遷移できること
  #- ログアウト状態のユーザーは、商品出品ページへ遷移しようとすると、ログインページへ遷移すること

  def create
     #Item.create.(item_params)
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
   params.require(:item).permit(:image, :name, :explanation, :category_id, :status_id, :deli_price_id, :area_id, :deli_day_id, :price).merge(user_id: current_user.id)
   end

   def user_params
    params.require(:user).permit(:email, :password)
  end

  def redirect_root
    redirect_to user_sessions_path unless user_signed_in?
  end

end