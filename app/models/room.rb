class Room < ApplicationRecord
    mount_uploader :image, ImageUploader
    has_many :reservations
    has_many :users
end
