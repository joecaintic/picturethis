class UsersController < ApplicationController
before_filter :authenticate_user!


  def index
      @users = User.where.not("id = ?",current_user.id).order("created_at DESC")
      @conversations = Conversation.involving(current_user).order("created_at DESC")

      

  end

  def new
    @user=User.new
  end

end
