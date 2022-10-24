# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    @users = User.with_attached_avatar.order(:id).page(params[:page])
  end

  def show
    @user = User.find(params[:id])
  end

  def following
    @user = User.find(params[:id])
    @user_name = @user.name == '' ? @user.email : @user.name
    @users = @user.following.with_attached_avatar.order(:id).page(params[:page])
  end

  def followers
    @user = User.find(params[:id])
    @user_name = @user.name == '' ? @user.email : @user.name
    @users = @user.followers.with_attached_avatar.order(:id).page(params[:page])
  end
end
