class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :role, :active, :last_login_at, :name, :days_left
  #has_many :vacation_requests #important
end