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

  def update

  end

  def show

  end

  private

  def item_params
    params.require(:item).permit(:,)
  end


end
