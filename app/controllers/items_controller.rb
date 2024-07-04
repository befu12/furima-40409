class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]

  def index
    @items = Item.all.order(created_at: :desc)
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

  def show
    @item = Item.find(params[:id])
  end  

  def edit
    @item = Item.find(params[:id])
    if current_user != @item.user
      redirect_to root_path
    end  
  end  

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit, status: :unprocessable_entity
    end  
  end  
 
  private

  def item_params
    params.require(:item).permit(:explanation, :item_name, :price, :condition_id, :category_id , :burden_id, :prefecture_id, :estimate_id, :image).merge(user_id: current_user.id)
  end  
end