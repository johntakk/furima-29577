class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @order = Order.new
  end

  def create
    @item = Item.find(params[:item_id])
    @order = Order.new(order_params)
    if @order.valid? 
      @order.save
      redirect_to root_path
    else
      render :index
    end
  end
  
  private

  def order_params 
    params.permit(:prefecture_id, :postal_code, :city, :detail_address, :building_name, :tel_num, :item_id).merge(user_id: current_user.id)
  end
end
