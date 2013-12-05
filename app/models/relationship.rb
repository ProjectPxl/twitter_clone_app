class Relationship < ActiveRecord::Base

	belongs_to :follower, classname: "Member"
	belongs_tp :followed, classname: "Member"

end
