get '/' do
  erb :index
end

get '/:username' do
  @username = TwitterUser.find_or_create_by_username(params[:handle])

  if tweets_stale?
    fetch_tweets!

  end

  @tweets = @username.tweets.limit(10)

  erb :tweets
end