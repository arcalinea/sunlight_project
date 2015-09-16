require 'bcrypt'

class User < ActiveRecord::Base
	include BCrypt
  # Remember to create a migration!
  validates :email, presence: :true, uniqueness: :true
  validates :hashed_password, presence: :true

  # BCrypt password hashing methods

  def password
		@password ||= Password.new(hashed_password)
	end

	def password=(new_password)
		@password = Password.create(new_password)
		self.hashed_password = @password
	end
end
