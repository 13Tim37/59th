class AccessController < ApplicationController
  
  before_action :confirm_logged_in, :except =>[:login, :attempt_login, :logout]
  
  def index
	# display text & links
  end

  def login
	# login form
  end
  
  def attempt_login
	if params[:user_name].present? && params[:password].present?
		found_user = User.where(:user_name => params[:user_name]).first
		if found_user
			authorized_user = found_user.authenticate(params[:password])
		end
	end
	if authorized_user
		# mark user as logged in
		session[:user_id] = authorized_user.id
		session[:user_name] = authorized_user.user_name
		session[:admin] = authorized_user.admin
		flash[:notice] = "You are now logged in."
		redirect_to(:action => 'index')
	else
		flash[:notice] = "Invalid username/password combination."
		redirect_to(:action => 'login')
	end
  end
  
  def logout
	# mark user as logged out
	session[:user_id] = nil
	session[:user_name] = nil
	session[:admin] = nil
	flash[:notice] = "You are now logged out."
	redirect_to(:action => 'login')
  end
  
end
