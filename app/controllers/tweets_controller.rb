# frozen_string_literal: true

class TweetsController < ApplicationController
  def index
    fetch_new_tweets if current_user
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
