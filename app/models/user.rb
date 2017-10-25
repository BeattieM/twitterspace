class User < ActiveRecord::Base
  class << self
    def find_or_create_from_auth_hash(auth_hash)
        user = where(uid: auth_hash.uid).first_or_create
        user.update(
          nickname: auth_hash.info.nickname,
          profile_image: auth_hash.info.image,
          token: auth_hash.credentials.token,
          secret: auth_hash.credentials.secret
        )
        user
      end
  end
end
