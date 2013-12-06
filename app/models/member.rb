class Member < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :tweets, dependent: :destroy

  has_many :follower_relationships, class_name: "Relationship", foreing_key: "followed_id"
  has_many :followed_relationships, class_name: "Relationship", foreing_key: "follower_id"

  has_many :followers, through: :follower_relationships
  has_many :followeds, through: :followed_relationships

  attr_accessor :login

  validates :username, uniqueness: true

  protected

	def self.find_for_database_authentication(conditions)
		login = conditions.delete(:login)
	  where(conditions)
	  .where(["lower(username) = :value OR lower(email) = :value",
    { :value => login.downcase }]).first
	end

  def following? member
    self.followeds.include? member
  end

  def follow member
    Relationship.create follower_id: self.id, followed_id: current_member .id
  end
end
