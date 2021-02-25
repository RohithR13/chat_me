class UsersController < ApplicationController
  before_action :require_user, only: [:edit, :destroy,:update]
  def new
    @user = User.new
  end
  def create 
    @user = User.create(user_params)
    if @user.save
      flash[:success] = "You signed up successfully"
    else 
      flash[:error] = "there was a error occur form is invalid try again "
    end
    render "new"
  end
  def edit
    @user =User.find_by(id: current_user["id"])
    unless @user.present?
      redirect_to login_path
    end
  end
  def update
    @user = User.find_by(id: current_user["id"])
    if @user.present? 
      if @user.update(update_params)
        flash[:success] = "You have successfully updated details"
      else
        flash[:error] = "There was error in updating the details"
      end
    end
    render "edit"
  end
  def destroy
   
    @user = current_user
    if @user.present?
      
      @user.destroy
      session.clear
      flash[:success] = "you have successfully deleted the account" 
    else 
        flash[:error] = "There was an error occur " 
    end
    redirect_to login_path
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :user_id)
  end
  def update_params
    params.fetch(:user).permit(:username, :password, :user_id)
  end
end
