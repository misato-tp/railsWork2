class AddColumnReservations < ActiveRecord::Migration[6.1]
  def change
    add_column :reservations, :total_days, :integer
    add_column :reservations, :total_price, :integer
    add_column :reservations, :user_id, :integer
  end
end
