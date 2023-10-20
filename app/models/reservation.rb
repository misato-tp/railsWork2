class Reservation < ApplicationRecord
    mount_uploader :image, ImageUploader
    belongs_to :user, optional: true

    with_options presence: true do
        validates :start_date
        validates :end_date
        validates :how_many_people
    end

    validate :start_end_check

    def start_end_check
        errors.add(:end_date, "はチェックイン以降の日付で選択してください。") if end_date.nil? || end_date < start_date
    end
end
