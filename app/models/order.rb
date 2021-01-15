class Order

  include ActiveModel::Model

  attr_accessor :item_id, :user_id, :postal_code, :prefecture_id, :city, :detail_address, :tel_num, :token

  with_options presence: true do
    validates :token
    validates :
    validates :

  def save
    # 各テーブルにデータを保存する処理を書く
  end
end