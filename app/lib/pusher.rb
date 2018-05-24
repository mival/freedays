require 'andpush'

class Pusher

  def self.client
    Andpush.new(ENV.fetch('FCM_SERVER_KEY'), pool_size: 25)
  end

  def self.push(payload)
    client.push(payload)
  end
end