class ImageSettings < ActiveRecord::Migration[6.1]
  def up
    add_column :rooms, :image2, :string
  end
end
