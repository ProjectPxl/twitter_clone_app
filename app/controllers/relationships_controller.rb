class RelationshipsController < ApplicationController

	def create
		@rel = Relationship.new
		@rel.followed_id = params[:followed_id]
		@rel.follower_id = current_member.id

		if @rel.save
			redirect_to Member.find params[:followed_id]
		else
			flash[:alert] = "Couldn't follow"
			redirect_to root_path
		end
	end

	def destroy
	    @relationship = Relationship.find(params[:id])
	    @relationship.destroy
	    redirect_to user_path params[:id]
	end


end
