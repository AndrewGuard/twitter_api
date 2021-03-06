helpers do
  def fetch_tweets!
    Twitter.search("from:#{@username.username}").results.map do |tweet|
      if TwitterUser.find_by_username(@username.username).tweets.find_by_text(tweet.text)

        tweet_id = TwitterUser.find_by_username(@username.username).tweets.find_by_text(tweet.text).id
        Tweet.update(tweet_id, text: tweet.text)
      else
        TwitterUser.find_by_username(@username.username).tweets.create(text: tweet.text)
      end
    end
  end

  def tweets_stale?(var)
    Time.now - var.updated_at > 1
  end

end

