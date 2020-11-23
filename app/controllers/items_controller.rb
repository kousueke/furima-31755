class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    # Item.create(item_params)
  end

  def destroy
    
  end

  def edit
  end

  #def update
   # if current_user.update(user_params)
    #redirect_to root_path
    #else
    #render :edit
    #end
  #end

  def show

  end

  private

 # def item_params
   # params.require(:item).permit(:,)
  #end

  #def user_params
   # params.require(:user).permit(:nickname, :firstname, :lastname, :firstname_kana, :lastname_kana, :bithday)
  #end
end
