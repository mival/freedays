class VacationRequestSerializer < ActiveModel::Serializer
  attributes :id, :start_day, :end_day, :accepted
  attribute :business_days
  has_one :user
  has_one :vacation_type
  has_many :documents
end