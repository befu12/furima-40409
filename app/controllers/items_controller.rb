class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def index
<<<<<<< HEAD
    @items = Item.all
=======
    @items = Item.all.order(created_at: :desc)
>>>>>>> 06f80d42695dc4a1bd22206a44dc73983876be4b
  end

  def new
    @item = Item.new
  end  

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end 

  private

  def item_params
    params.require(:item).permit(:explanation, :item_name, :price, :condition_id, :category_id , :burden_id, :prefecture_id, :estimate_id, :image).merge(user_id: current_user.id)
  end  
end
