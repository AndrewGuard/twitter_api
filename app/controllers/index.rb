get '/' do
  erb :index
end

get '/:username' do
  @username = TwitterUser.find_or_create_by_username(params[:handle])

  p '------------- SELFIE ------------------'

  p @username

  if tweets_stale?(@username)
    fetch_tweets!
  end

  @tweets = @username.tweets.limit(10)

  erb :tweets
end