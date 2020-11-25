class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
     Item.create(item_params)
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

   def item_params
   params.require(:item).permit(:name, :explanation, :category_id, :status_id, :deli_price_id, :area_id, :deli_day_id, :price)#.merge(user_id: current_user.id)
   end

end