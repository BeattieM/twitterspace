# frozen_string_literal: true

class User < ActiveRecord::Base
  has_many :tweets
  class << self
    def find_or_create_from_auth_hash(auth_hash)
      user = where(uid: auth_hash.uid).first_or_create
      user.update(auth_hash_to_user(auth_hash))
      user
    end

    private

    def auth_info(auth_hash)
      auth_hash.info
    end

    def auth_credentials(auth_hash)
      auth_hash.credentials
    end

    def auth_hash_to_user(auth_hash)
      info = auth_info(auth_hash)
      creds = auth_credentials(auth_hash)
      { nickname: info.nickname,
        profile_image: info.image,
        token: creds.token,
        secret: creds.secret }
    end
  end

  def twitter_client
    Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['TWITTER_KEY']
      config.consumer_secret     = ENV['TWITTER_SECRET']
      config.access_token        = token
      config.access_token_secret = secret
    end
  end
end
