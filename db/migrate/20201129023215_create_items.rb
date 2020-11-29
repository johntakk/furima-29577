class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name,           null: false, default: ""
      t.string :explanation,           null: false, default: ""
      t.string :category,           null: false, default: ""
      t.string :status,           null: false, default: ""
      t.string :description,           null: false, default: ""
      t.string :delivery_term,           null: false, default: ""
      t.string :delivery_from,           null: false, default: ""
      t.string :delivery_leadtime,           null: false, default: ""
      t.string :price,           null: false, default: ""
      t.string :handling_fee,           null: false, default: ""
      t.string :profit,           null: false, default: ""
      t.timestamps
    end
  end
end
