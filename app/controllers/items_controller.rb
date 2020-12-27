class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :destroy, :edit, :update]
  before_action :item_find, only:[:destroy, :edit, :update, :show]

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
    if current_user == @item.user
    @item.destroy
    end
      redirect_to root_path
  end

  def edit
    if current_user != @item.user
       redirect_to root_path
    end
  end

  def update
    if current_user != @item.user
      redirect_to root_path
    end
    
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def show
  end

  def search
  end

  private

  def item_params 
    params.require(:item).permit(:image, :name, :explanation, :category_id, :status_id, :delivery_term_id, :delivery_from_id, :delivery_leadtime_id, :price).merge(user_id: current_user.id)
  end

  def item_find
    @item = Item.find(params[:id])
  end

end

