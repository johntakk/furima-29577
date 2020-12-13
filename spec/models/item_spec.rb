require 'rails_helper'

RSpec.describe Item, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
  describe '商品出品' do
    it '画像が無いと出品できない' do
      @item.image = ''
      @user.valid?
      expect(@item.errors.full_messages).to include("image can't be blank")
    end
  end
end
