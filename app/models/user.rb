class User < ApplicationRecord
  has_secure_password

  enum role:[:worker, :supervisor, :admin]
  store_accessor :profile, :name
  store_accessor :profile, :days_left

  scope :username_start, ->(username){ where username: username }

  #has_many :vacation_requests # important
end