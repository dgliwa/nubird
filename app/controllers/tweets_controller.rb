class TweetsController < AuthenticatedController

	#GET tweets
	def index
		@timeline = twitter_client.home_timeline
	end

	#NEW form
	def new 

	end

	def create		
		twitter_client.update(tweet_attributes[:new_tweet])
		redirect_to :action => :index
	end

	def show
		@tweet = twitter_client.status(params[:id])
	end

	private def tweet_attributes
		params.require(:tweet).permit(:new_tweet)
	end

	private def twitter_client
		client = Twitter::REST::Client.new do |config|
			config.consumer_key = ENV['TWITTER_API_KEY']
			config.consumer_secret = ENV['TWITTER_API_SECRET']
			config.access_token = current_user.access_token
			config.access_token_secret = current_user.access_token_secret
		end
	end
end