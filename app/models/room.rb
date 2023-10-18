class Room < ApplicationRecord
    mount_uploader :image, ImageUploader

    with_options presence: true do
        validates :facility_name
        validates :detail
        validates :price, numericality:{greater_than_or_equal_to: 1}
        validates :address
        validates :start_date
        validates :end_date
        validates :how_many_people, numericality:{greater_than_or_equal_to: 1}
    end

    validate :start_end_check

    def start_end_check
        errors.add(:end_date,"はチェックインの日付より後の日にしてください") unless
        self.start_date < self.end_date
    end

end
