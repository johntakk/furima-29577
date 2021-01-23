class OrdersController < ApplicationController
  before_action :item_find, only:[:index, :create]
  before_action :authenticate_user!, only:[:index]

  def index
  if current_user != @item.user && @item.order_history == nil
    @order = Order.new
    elsif 
   redirect_to root_path
  end

  end

  def create
    @order = Order.new(order_params)
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

  def item_find
    @item = Item.find(params[:item_id])
  end

end
