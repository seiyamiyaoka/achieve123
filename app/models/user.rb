class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  mount_uploader :image_url
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable, :omniauthable # confirmable
  has_many :blogs,:dependent => :destroy
  #   likeをたくさんもっている
  has_many :likes
  #userがいいね！しているblogを取得する
  has_many :like_notes,through: :likes,source: :blog
  #   userが複数providerと連携する
  has_many :providers
def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
  user = User.where(provider: auth.provider).first
  unless user
  user = User.create(name: auth.extra.raw_info.name,
                   provider: auth.provider,
                   uid: auth.uid,
                   email: User.create_unique_email,
                   password: Devise.friendly_token[0,20])
  end
      user
  end

 def self.find_for_twitter_oauth(auth, signed_in_resource=nil)
  user = User.where(provider: auth.provider, uid: auth.uid).first

  unless user
         user = User.create(name: auth.info.nickname,
                   provider: auth.provider,
                   uid: auth.uid,
                   profile_image_url: auth.info.image,
                   email: User.create_unique_email,
                   password: Devise.friendly_token[0,20])
#     raise user.inspect

    end
      user

    end

   def self.create_unique_string
      SecureRandom.uuid
    end

def self.create_unique_email
    User.create_unique_string + "@example.com"
  end
def social_profile(provider)
    social_profiles.select{ |sp| sp.provider == provider.to_s }.first
  end
#   def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
#     user = User.where(provider: auth.provider, uid: auth.uid).first
#     unless user
#       user = User.create(name: auth.extra.raw_info.name, provider: auth.provider, uid: auth.uid, email: auth.info.email, password: Devise.friendly_token[0,20])
#       end
#       user
#       def self.find_for_twitter_oauth(auth, signed_in_resource=nil)
#         user = User.where(provider: auth.provider, uid: auth.uid).first
#         unless user
#       user = User.create(name: auth.info.nickname, provider: auth.provider, uid: auth.uid, email: User.create_unique_email, password: Devise.friendly_token[0,20])
#       end
#       user

# end
# end
#   def self.create_unique_string
# SecureRandom.uuid
# end
#   def self.create_unique_email
# User.create_unique_string + "@example.com"
# end
end