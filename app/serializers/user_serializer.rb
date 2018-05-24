class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :role, :active, :last_login_at, :name, :surname,
             :phone, :email, :total_days, :language, :remaining_days, :push_token
  #has_many :vacation_requests #important
end