class User < ApplicationRecord
  authenticates_with_sorcery!

  attr_accessor :password, :password_confirmation

  has_many :articles, dependent: :destroy

  def username
    self.name.nil? ? self.email.split('@').first : self.name
  end

end
