class User < ActiveRecord::Base
	attr_accessible :email, :name, :password, :password_confirmation
	has_secure_password

	before_save {|user| user.email = email.downcase }

	EMAIL_FMT = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :name, presence: true, length: { maximum:50 }, uniqueness: { case_sensitive: false }
	validates :email, presence: true, format: { with: EMAIL_FMT }, uniqueness: { case_sensitive: false }
	validates :password, presence: true, length: { minimum: 6 }
	validates :password_confirmation, presence: true
end
