class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_item, only: [:show, :edit, :update]
  before_action :move_to_root, only: [:edit, :update]

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
  end  

  def edit
    if @item.order.present?
      redirect_to root_path
    end  
  end  

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit, status: :unprocessable_entity
    end  
  end  

  def destroy
    item = Item.find(params[:id])
    if item.user = current_user
      item.destroy
    end  
    redirect_to root_path
  end
 
  private

  def item_params
    params.require(:item).permit(:explanation, :item_name, :price, :condition_id, :category_id , :burden_id, :prefecture_id, :estimate_id, :image).merge(user_id: current_user.id)
  end  

  def set_item
    @item = Item.find(params[:id])
  end  

  def move_to_root
    unless @item.user == current_user
      redirect_to root_path
    end  
  end
end