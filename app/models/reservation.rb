class Reservation < ApplicationRecord
    mount_uploader :image, ImageUploader
    has_many :rooms
end
