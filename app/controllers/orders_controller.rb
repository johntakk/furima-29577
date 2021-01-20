class OrdersController < ApplicationController
  def index
  @item = Item.find(params[:item_id])
  if user_signed_in? && current_user != @item.user
    @order = Order.new
    elsif 
   redirect_to root_path
  end

  end

  def create
    @item = Item.find(params[:item_id])
    @order = Order.new(order_params)
    # binding.pry
    if @order.valid? 
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,  # 商品の値段
        card: order_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
      @order.save
      redirect_to root_path
    else
      render :index
    end
  end
  
  private

  def order_params 
    params.permit(:prefecture_id, :postal_code, :city, :detail_address, :building_name, :tel_num, :item_id, :token).merge(user_id: current_user.id)
  end
end
