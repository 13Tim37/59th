class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  private
  
  def confirm_logged_in
	unless session[:user_id]
		flash[:notice] = "Please log in."
		redirect_to(:controller => 'access', :action => 'login')
		return false # halts the before action
	else
		return true
	end  
  end
  
  private 
  
  def check_if_admin
	if !session[:admin]
		flash[:notice] = "You must be admin to access that!"
		redirect_to(:controller => 'access', :action => 'index')
		return false # halts the before action
	else
		return true
	end  
  end
  
#  private
#  
#  def check_logged_in
#	if session[:user_id] != nil
#		return true # halts the before action
#	else
#		return false
#	end  
#  end
  
end
