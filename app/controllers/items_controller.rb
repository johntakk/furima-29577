class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :destroy, :edit, :update]

  def index
  end

  def new
    @item = Item.new
  end

  def create
    Item.create(item_params)
  end

  def destroy
  end

  def edit
  end

  def update
  end

  def show
  end

  def search
  end

  private

end
