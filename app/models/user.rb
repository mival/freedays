class User < ApplicationRecord
  has_secure_password

  enum role:[:worker, :supervisor, :admin]
  store_accessor :profile, :name
  store_accessor :profile, :surname
  store_accessor :profile, :phone
  store_accessor :profile, :email
  store_accessor :profile, :total_days
  store_accessor :profile, :language
  store_accessor :profile, :push_token
  scope :username_start, ->(username){ where username: username }
  has_many :vacation_requests, dependent: :delete_all

  default_value_for :total_days, 30

  def generate_password_token!
    self.reset_password_token = generate_token
    self.reset_password_sent_at = Time.now.utc
    save!
  end

  def password_token_valid?
    (self.reset_password_sent_at + 4.hours) > Time.now.utc
  end

  def reset_password!(password)
    self.reset_password_token = nil
    self.password = password
    save!
  end

  def remaining_days
    (total_days.to_i - vacation_requests.where(accepted: true).sum(&:business_days)).to_i
  end



  private

  def generate_token
    SecureRandom.hex(10)
  end

  #has_many :vacation_requests # important
end