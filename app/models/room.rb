class Room < ApplicationRecord
    mount_uploader :image, ImageUploader
    belongs_to :reservation
end
