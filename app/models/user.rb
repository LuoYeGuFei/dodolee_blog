class User < ApplicationRecord
  authenticates_with_sorcery!

  mount_uploader :avatar, AvatarUploader

  attr_accessor :password, :password_confirmation

  has_many :articles, dependent: :destroy
  has_many :comments
  has_one :resume

  USERNAME_FORMAT = /[a-zA-Z0-9\-\_]*/

  def username
    self.name.nil? ? self.email.split('@').first : self.name
  end

end
