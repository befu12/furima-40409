class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @itemorder = ItemOrder.new
  end
end
