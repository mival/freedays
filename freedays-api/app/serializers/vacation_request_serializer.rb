class VacationRequestSerializer < ActiveModel::Serializer
  attributes :id, :start_day, :end_day, :accepted
  has_one :user
  has_one :vacation_type
end