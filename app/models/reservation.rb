class Reservation < ApplicationRecord
    mount_uploader :image, ImageUploader
    belongs_to :user, optional: true

    with_options presence: true do
        validates :start_date
        validates :end_date
    end
    validates :how_many_people, numericality:{greater_than_or_equal_to: 1}
    validate :start_end_check
    validate :date_before_start

    def start_end_check 
        return unless start_date && end_date

        if !end_date.after?(start_date)
            errors.add(:end_date,"はチェックイン日以降の日付で選択してください。")
        end
    end

    def date_before_start
    return if start_date.blank?
        errors.add(:start_date, "は今日以降のものを選択してください") if start_date < Date.today
    end

end
