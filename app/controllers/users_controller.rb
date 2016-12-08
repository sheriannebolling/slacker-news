class UsersController < ActionController::Base
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @posts = Post.all
    if @user.save
      session[:user_id] = @user.id
      render 'posts/index'
    else
      render 'new'
    end
  end

  private
    def user_params
      params.require(:user).permit(:username, :email, :password)
    end
end
