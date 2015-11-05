class SessionsController < ApplicationController

  before_filter :authenticate_user, :only => [:home, :profile, :setting]
  before_filter :save_login_state, :only => [:login, :login_attempt]

  def home
    @current_user
  end

  def login
    #Login Form
  end

  def admin_home
    @current_user
  end

  def login_attempt
    authorized_user = User.authenticate(params[:username_or_email],params[:login_password])
    if authorized_user
      session[:user_id] = authorized_user.id
      if(authorized_user.equal?("Admin"))
        redirect_to(:action => 'admin_home')
      else
        redirect_to(:action => 'home')
      end
    else
      flash[:notice] = "Invalid Username or Password"
      #flash[:color]= "invalid"
      render "login"
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to :action => 'login'
  end



end
