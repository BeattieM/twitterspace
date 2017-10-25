# frozen_string_literal: true

class TweetsController < ApplicationController
  def index
    if current_user
      if !current_user.tweets.empty?
        if current_user.tweets.last.created_at <= Time.now - 5.minutes
          fetch_new_tweets
        end
      else
        fetch_new_tweets
      end
    end
    @tweets = current_user ? Tweet.where(user: current_user).reverse : []
    @tweet = Tweet.new
  end

  def create
    current_user.twitter_client.update(params[:tweet][:text])
    fetch_new_tweets
    redirect_to root_path
  end

  private

  def fetch_new_tweets
    client = current_user.twitter_client
    tweets = client.home_timeline.reverse
    current_tweet_ids = Tweet.where(user: current_user).pluck(:uid)
    tweets.select! {|tweet| !current_tweet_ids.include? tweet.id.to_s}
    tweets.each do |tweet|
      Tweet.create(user: current_user, uid: tweet.id, json: tweet.to_h)
    end
  end
end
