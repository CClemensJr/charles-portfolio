module SocialTool
  def self.twitter_search
    # Plug in twitter account info
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV.fetch("TWITTER_CONSUMER_KEY")
      config.consumer_secret     = ENV.fetch("TWITTER_CONSUMER_SECRET")
      config.access_token        = ENV.fetch("TWITTER_ACCESS_TOKEN")
      config.access_token_secret = ENV.fetch("TWITTER_ACCESS_SECRET")
    end

    # Search for the 6 most recent tweets on rails
    client.search("#rubyonrails", lang: 'en', result_type: 'recent').take(6).collect do |tweet|
      # And post the user name and tweet
      "#{tweet.user.screen_name}: #{tweet.text}"
    end
  end
end
