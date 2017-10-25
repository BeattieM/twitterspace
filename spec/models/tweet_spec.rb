# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Tweet, type: :model do
  it { should respond_to(:json) }
  it { should respond_to(:user) }
  it { should respond_to(:entities) }
  it { should respond_to(:retweet_count) }
  it { should respond_to(:favorite_count) }
  it { should respond_to(:created_at) }
  it { should respond_to(:text) }
  it { should respond_to(:status) }
  it { should belong_to(:owner) }
end
