class VacationRequest < ApplicationRecord
  scope :calendar, -> (_){where accepted: true}
  scope :pendent, ->(status) {where accepted: nil}
  scope :status, ->(status) {status = ActiveRecord::Type::Boolean.new.cast(status); where accepted: status}
  scope :by_user, ->(user){where user_id: user}
  scope :accepted, -> {where accepted: true}
  scope :date_range, -> (start_date, end_date) {where('(start_day, end_day) OVERLAPS (?, ?)', start_date, end_date)}
  belongs_to :user
  belongs_to :vacation_type
  has_many :documents, as: :attachable
end