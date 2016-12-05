class SessionsController < ApplicationController
  def new

  end

  def create
    @user = User.find_by(username: params[:session][:username]).try(:authenticate, params[:session][:password])
    if @user 
      session[:user_id] = @user.id
      render 'users/show'
    else
      @errors = ["Username/password combination is incorrect"]
      render 'new'
    end
  end
end