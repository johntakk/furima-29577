class CreateDeliveryTos < ActiveRecord::Migration[6.0]
  def change
    create_table :delivery_tos do |t|
      t.string :postal_code,           null: false
      t.integer :prefecture_id,              null: false
      t.string :city,           null: false
      t.string :detail_address,           null: false
      t.string :building_name
      t.string :tel_num,           null: false
      t.references :order_history, foreign_key: true
      t.timestamps
    end
  end
end
