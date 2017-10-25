class Tweet < ActiveRecord::Base
  belongs_to :user
  attr_accessor :text
end
