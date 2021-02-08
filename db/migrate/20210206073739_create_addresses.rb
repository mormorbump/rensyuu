class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string   :postal_code,         null: false
      t.integer  :area,             null: false
      t.string   :city,        null: false
      t.string   :block_number,        null: false
      t.string   :house_number 
      t.string   :phone_number,        null: false
      t.references :user
      t.timestamps
    end
  end
end
