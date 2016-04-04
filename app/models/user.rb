class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  require 'mail'
  # validate :add_error

  # def add_error
  #   if email.empty?
  #   errors.add(:email, "が空でやんす")
  #   errors.add(:password, "からではダメだ")
  #   end
  # end


  has_many :tasks, dependent: :destroy

  mount_uploader :image_url

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable, :omniauthable # confirmable

  has_many :blogs,:dependent => :destroy
  has_many :comments
  has_many :questions
  has_many :answers

  has_many :relationships, class_name: 'Relationship', foreign_key: 'follower_id', dependent: :destroy
  has_many :reverse_relationships, class_name: 'Relationship', foreign_key: 'followed_id', dependent: :destroy
  has_many :followed_users, through: :relationships, source: :followed
  has_many :followers, through: :reverse_relationships, source: :follower


  def self.find_for_facebook_oauth(auth, signed_in_resource=nil)

    user = User.where(provider: auth.provider, uid: auth.uid).first

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

  def follow!(other_user)
    relationships.create!(followed_id: other_user.id)
  end

  def unfollow!(other_user)
    relationships.find_by(followed_id: other_user.id).delete
  end

  def following?(other_user)
    relationships.find_by(followed_id: other_user.id)
  end
  # フォローし合っているユーザ一覧を取得
end
