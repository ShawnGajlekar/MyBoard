class User < ApplicationRecord
	has_many :notices
	has_many :comments
	acts_as_messageable

	def name
		"User #{id}"
	end

	def mailboxer_email(object)
		nil
	end 

	
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
