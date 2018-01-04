class User < ApplicationRecord
  authenticates_with_sorcery!

  attr_accessor :password, :password_confirmation

  def username
    self.name.nil? ? self.email.split('@').first : self.name
  end

end
