class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable,
    :omniauthable, omniauth_providers: [:facebook, :google_oauth2]
  USER_PARAMS = %i(name email password avatar).freeze

  has_one_attached :avatar

  has_many :comments, dependent: :destroy
  mount_uploader :avatar, ImageUploader

  def self.new_with_session params, session
<<<<<<< HEAD
    tap do |user|
=======
    super.tap do |user|
>>>>>>> Category_view_home
      if data = session["devise.facebook_data"] &&
        session[:devise.facebook_data][:extra][:raw_info]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

  def self.from_omniauth auth
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.name = auth.info.name
    end
  end

  def current_user? user
    self == user
  end
end
