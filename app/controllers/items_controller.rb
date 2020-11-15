class ItemsController < ApplicationController
  before_action :set_item, only: [:edit, :show]
  before_action :move_to_index, except: [:index, :show, :search]

  def index
  end

  private
  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

end
