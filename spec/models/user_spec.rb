# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  it { should respond_to(:uid) }
  it { should respond_to(:nickname) }
  it { should respond_to(:profile_image) }
  it { should respond_to(:token) }
  it { should respond_to(:secret) }
  it { should have_many(:tweets) }
end
