# frozen_string_literal: true

class SessionsController < ApplicationController
  def create
    @user = User.find_or_create_from_auth_hash(auth_hash)
    create_session_user
    redirect_to root_path
  end

  def new; end

  def verify
    @user = User.find_by_nickname(params[:session][:nickname])
    if @user
      create_session_user
      redirect_to root_path
    else
      redirect_to '/auth/twitter?force_login=true'
    end
  end

  def destroy
    session[:user_id] = nil
    @current_user = nil
    redirect_to root_path
  end

  private

  def auth_hash
    request.env['omniauth.auth']
  end

  def create_session_user
    session[:user_id] = @user.id
  end
end
