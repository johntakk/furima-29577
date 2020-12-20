class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :destroy, :edit, :update]

  def index
    @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
  end

  def edit
  end

  def update
  end

  def show
    @item = Item.find(params[:id])
  end

  def search
  end

  private

  def item_params 
    params.require(:item).permit(:image, :name, :explanation, :category_id, :status_id, :delivery_term_id, :delivery_from_id, :delivery_leadtime_id, :price).merge(user_id: current_user.id)
  end

end


