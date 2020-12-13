require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe '商品出品' do
    it '画像が無いと出品できない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
    it '商品名が無いと出品できない' do
      @item.name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end
    it '商品の説明が無いと出品できない' do
      @item.explanation = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Explanation can't be blank")
    end
    it 'カテゴリー情報が無いと出品できない' do
      @item.category_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end
    it 'カテゴリーがハイフンだと出品できない' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Category must be other than 1")
    end
    it '商品の状態の情報が無いと出品できない' do
      @item.status_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Status can't be blank")
    end
    it '商品の状態がハイフンだと出品できない' do
      @item.status_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Status must be other than 1")
    end
    it '配送料の負担の情報が無いと出品できない' do
      @item.delivery_term_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery term can't be blank")
    end
    it '配送料の負担の情報がハイフンだと出品できない' do
      @item.delivery_term_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery term must be other than 1")
    end
    it '配送元の地域の情報が無いと出品できない' do
      @item.delivery_from_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery from can't be blank")
    end
    it '配送元の地域の情報がハイフンだと出品できない' do
      @item.delivery_from_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery from must be other than 1")
    end
    it '配送までの日数の情報が無いと出品できない' do
      @item.delivery_leadtime_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery leadtime can't be blank")
    end
    it '配送までの日数の情報がハイフンだと出品できない' do
      @item.delivery_leadtime_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery leadtime must be other than 1")
    end
    it '価格がブランクだと出品できない' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end
    it '価格が299円以下だと出品できない' do
      @item.price = 100
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not included in the list")
    end
    it '価格が10,000,000円以上だと出品できない' do
      @item.price = 10000000
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not included in the list")
    end
  end
end
