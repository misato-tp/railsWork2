class AddDetailsReservations < ActiveRecord::Migration[6.1]
  def change
    add_column :reservations, :image, :string
    add_column :reservations, :detail, :text
    add_column :reservations, :facility_name, :string
  end
end
