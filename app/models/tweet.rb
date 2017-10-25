# frozen_string_literal: true

class Tweet < ActiveRecord::Base
  belongs_to :owner, foreign_key: 'user_id', class_name: 'User'
  store_accessor :json, :user, :entities, :retweet_count, :favorite_count, :created_at, :text
  attr_accessor :status
end
