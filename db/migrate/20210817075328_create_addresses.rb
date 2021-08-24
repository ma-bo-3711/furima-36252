class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string      :deli_num,      null: false
      t.integer     :area_id,       null: false
      t.string      :ward,          null: false
      t.string      :block,         null: false
      t.string      :room ,         null: false
      t.string      :phone,         null: false
      t.references  :order,         foreign_key: true
      
      t.timestamps
    end
  end
end
