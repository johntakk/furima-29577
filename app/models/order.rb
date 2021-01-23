class Order
  include ActiveModel::Model

  attr_accessor :item_id, :user_id, :postal_code, :prefecture_id, :city, :detail_address, :building_name, :tel_num, :token

  with_options presence: true do
    validates :token
    validates :item_id
    validates :user_id
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'はハイフンが必要です' }
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :city
    validates :detail_address
    validates :tel_num, length: { maximum: 11 }, numericality: { only_integer: true }
  end
  
  def save
    # 各テーブルにデータを保存する処理を書く
    order_history=OrderHistory.create!(item_id: item_id,user_id: user_id)
    DeliveryTo.create(postal_code: postal_code,prefecture_id: prefecture_id,city: city,detail_address: detail_address,building_name: building_name,tel_num: tel_num,order_history_id: order_history.id)
  end
end