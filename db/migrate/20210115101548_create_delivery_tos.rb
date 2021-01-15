class CreateDeliveryTos < ActiveRecord::Migration[6.0]
  def change
    create_table :delivery_tos do |t|
      t.integer :postal_code,           null: false
      t.integer :prefecture_id,              null: false
      t.string :city,           null: false
      t.string :detail_address,           null: false
      t.integer :tel_num,           null: false
      t.timestamps
    end
  end
end
