class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = 'New User has been created'
      redirect_to users_path
    else
      render :new
    end
  end

  def show
    @user = Model.find(params[:id])
  end

  def destroy
    @user = Model.find(params[:id]).destroy
    flash[:notice] = 'User has been Deleted!'

    redirect_to '/'
  end


  private

  def user_params
    params.require(:user).permit(:first_name, :last_name)
  end
end
