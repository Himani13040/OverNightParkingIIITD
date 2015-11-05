class UsersController < ApplicationController

  before_filter :save_login_state, :only => [:new, :create]

  def new
    @user = Student.new
  end

  def create
    @user = Student.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to(:controller => 'sessions', :action => 'home')
     else
      render "new"
     end
  end

  private
    def user_params
      params.require(:user).permit(:username,:email,:encrypted_password, :phone_no, :gender, :role, :rollno_empid)
    end
end
