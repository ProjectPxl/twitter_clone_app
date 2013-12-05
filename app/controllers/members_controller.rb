class MembersController < ApplicationController

	before_filter :authenticate_member!

	def index
		
	end

	def show
    	@member = current_member
    	@tweet = Tweet.new

    	@rel = Relationship.where(follower_id: current_member.id,
    		followed_id: @member.id).first_or_initialize if current_member
  	end
end
