class TweetsController < ApplicationController

	def create
		@tweet = Tweet.create(tweet_params)
		@tweet.member_id = current_member.id

		if @tweet.save
			redirect_to members_show_path
		else
			flash[:alert] = "Tweet Not Posted!"
			redirect_to root_path
		end
	end

	private
	def tweet_params
		params.require(:tweet).permit(:content, :member_id)
	end

end
