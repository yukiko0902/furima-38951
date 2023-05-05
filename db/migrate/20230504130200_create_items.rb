class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string  :item_name            ,       null:false
      t.text    :description_of_item  ,       null:false
      t.integer :item_category_id     ,       null:false
      t.integer :item_state_id        ,       null:false
      t.integer :shipping_charge_id   ,       null:false
      t.integer :prefecture_id        ,       null:false
      t.integer :days_to_delivery_id  ,       null:false
      t.integer :price                ,       null:false
      t.references :user              ,       null:false, foregin_key: true
      t.timestamps  
    end
  end
end
