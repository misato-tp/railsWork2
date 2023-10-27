class Room < ApplicationRecord
    mount_uploader :image, ImageUploader
    has_many :reservations

    with_options presence: true do
        validates :facility_name
        validates :detail
        validates :price, numericality:{greater_than_or_equal_to: 1}
        validates :address
    end

end
