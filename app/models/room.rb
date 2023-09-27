class Room < ApplicationRecord
    mount_uploader :image, ImageUploader
    has_many :reservations
end
