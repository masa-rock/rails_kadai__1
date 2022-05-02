class Post < ApplicationRecord
  validates :title,presence:true
  validates :start_date,presence:true
  validates :end_date,presence:true
  validate :date_before_finish

  def date_before_finish
    if end_date.blank?
      errors.add(:end_date,"は今日以降の日付で選択してください") 
    elsif end_date < Date.today
      errors.add(:end_date,"は今日以降の日付で選択してください") 
    end
  end

end
