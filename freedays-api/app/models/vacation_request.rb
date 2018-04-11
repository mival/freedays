class VacationRequest < ApplicationRecord
  scope :accepted, -> {where accepted: true}
  scope :pendent, ->(status) {where accepted: nil}
  scope :status, ->(status) {status = ActiveRecord::Type::Boolean.new.cast(status); where accepted: status}
  belongs_to :user
  belongs_to :vacation_type
end