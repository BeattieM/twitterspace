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
    @tweets = current_user ? Tweet.where(owner: current_user).reverse : []
    @tweet = Tweet.new
  end

  def create
    twitter_client.update(params[:tweet][:text])
    fetch_new_tweets
    redirect_to root_path
  end

  private

  def fetch_new_tweets
    tweets = twitter_client.home_timeline.reverse
    current_tweet_ids = Tweet.where(owner: current_user).pluck(:uid)
    tweets.reject! { |tweet| current_tweet_ids.include? tweet.id.to_s }
    tweets.each do |tweet|
      Tweet.create(owner: current_user, uid: tweet.id, json: tweet.to_h)
    end
  end

  def twitter_client
    Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['TWITTER_KEY']
      config.consumer_secret     = ENV['TWITTER_SECRET']
      config.access_token        = current_user.token
      config.access_token_secret = current_user.secret
    end
  end
end
