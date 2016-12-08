class SessionsController < ApplicationController
  def new

  end

  def create
    @user = User.find_by(username: params[:session][:username]).try(:authenticate, params[:session][:password])
    @posts = Post.all
    if @user 
      session[:user_id] = @user.id
      render 'posts/index'
    else
      @errors = ["Username/password combination is incorrect"]
      render 'new'
    end
  end
end