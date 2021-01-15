class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
  end
  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end
end
