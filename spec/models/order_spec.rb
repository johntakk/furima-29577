require 'rails_helper'
RSpec.describe Order, type: :model do
  before do
    @order = FactoryBot.build(:order)
  end
  describe '商品購入機能' do
    it 'tokenが無いと購入できない' do
      @order.token = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Token can't be blank")
    end
    it 'item_idが無いと購入できない' do
      @order.item_id = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Item can't be blank")
    end
    it 'user_idが無いと購入できない' do
      @order.user_id = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("User can't be blank")
    end
    it '郵便番号が無いと購入できない' do
      @order.postal_code = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Postal code can't be blank")
    end
    it '郵便番号にハイフンが無いと購入できない' do
      @order.postal_code = 1111111
      @order.valid?
      expect(@order.errors.full_messages).to include("Postal code はハイフンが必要です")
    end
    it '都道府県が無いと購入できない' do
      @order.prefecture_id = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Prefecture can't be blank")
    end
    it '都道府県がハイフンだと購入できない' do
      @order.prefecture_id = 1
      @order.valid?
      expect(@order.errors.full_messages).to include("Prefecture must be other than 1")
    end
    it '市町村が無いと購入できない' do
      @order.city = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("City can't be blank")
    end
    it '番地が無いと購入できない' do
      @order.detail_address = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Detail address can't be blank")
    end
    it '電話番号が無いと購入できない' do
      @order.tel_num = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Tel num can't be blank")
    end
    it '電話番号が12桁以上では購入できない' do
      @order.tel_num = 111111111111
      @order.valid?
      expect(@order.errors.full_messages).to include("Tel num is too long (maximum is 11 characters)")
    end
    it '数字以外の文字が混じっている場合購入できない' do
      @order.tel_num = 'aaaaaaaaaa'
      @order.valid?
      expect(@order.errors.full_messages).to include("Tel num is not a number")
    end
  end
end
