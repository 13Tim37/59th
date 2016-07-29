class UsersController < ApplicationController

  layout false
  before_action :confirm_logged_in
  before_action :check_if_admin

  def index
	@users = User.sorted
  end

  def new
	@user = User.new
  end
  
  def create
	# Instantiate a new object using form parameters
	@user = User.new(user_params)
	# Save the object
	if @user.save
	# If save succeeds, redirect to the index action
		flash[:notice] = "User account created successfully."
		redirect_to(:action => 'index')
	# If save fails, redisplay the form so user can fix problems
	else
		render('new')
	end
  end
  
  def edit
	@user = User.find(params[:id])
  end

  def update
	@user = User.find(params[:id])
	if @user.update_attributes(user_params)
	  flash[:notice] = "User account updated successfully."
	  redirect_to(:action => 'index')
	else
	  render('edit')
	end
  end
  
  def delete
	@user = User.find(params[:id])
  end
  
  def destroy
	user = User.find(params[:id]).destroy
	flash[:notice] = "User account '#{user.user_name}' deleted successfully."
	redirect_to(:action => 'index')
  end

  def show
	@user = User.find(params[:id])
  end
  
  private
  
  def user_params
	params.require(:user).permit(:user_name, :email, :password, :admin)
  end
  
end
