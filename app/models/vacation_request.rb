class VacationRequest < ApplicationRecord
  scope :accepted, -> {where accepted: true}
  scope :pendent, ->(status) {where accepted: nil}
  scope :status, ->(status) {status = ActiveRecord::Type::Boolean.new.cast(status); where accepted: status}
  scope :by_user, ->(user){where user_id: user}
  belongs_to :user
  belongs_to :vacation_type
  has_many :documents, as: :attachable
end