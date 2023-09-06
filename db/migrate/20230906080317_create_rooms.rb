class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.string :facility_name
      t.text :detail
      t.integer :price
      t.string :address
      t.string :image

      t.timestamps
    end
  end
end
