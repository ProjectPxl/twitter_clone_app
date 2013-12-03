class Member < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :tweets

  attr_accessor :login

  validates :username, uniqueness: true

  protected
	def self.find_for_database_authentication(conditions)
		login = conditions.delete(:login)
	  where(conditions)
	  .where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
	end
end
