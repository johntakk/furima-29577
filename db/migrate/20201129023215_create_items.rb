class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name,           null: false, default: ""
      t.string :explanation,           null: false, default: ""
      t.integer :category_id, null: false
      t.integer :status_id,    null: false
      t.integer :delivery_term_id, null: false
      t.integer :delivery_from_id,           null: false
      t.integer :delivery_leadtime_id,           null: false
      t.string :price,           null: false, default: ""
      t.string :handling_fee,           null: false, default: ""
      t.string :profit,           null: false, default: ""
      t.timestamps
      t.references :user, foreign_key: true
    end
  end
end
