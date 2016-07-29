class NrpApplicationsController < ApplicationController
  
  before_action :confirm_logged_in, :except =>[:new, :create]
  
  def index
    @nrp_applications = NrpApplication.sorted
  end

  def show
    @nrp_application = NrpApplication.find(params[:id])
  end

  def new
    @nrp_application = NrpApplication.new
  end
  
  def create
	# Instantiate a new object using form parameters
	@nrp_application = NrpApplication.new(params.require(:nrp_application).permit(:user_name, :email, :age))
	# Save the object
	if @nrp_application.save
	# If save succeeds, redirect to the index action
		flash[:notice] = "Application created successfully."
		redirect_to(:action => 'index')
	else
	# If save fails, redisplay the form so user can fix problems
		render('new')
	end
  end

  def edit
	@nrp_application = NrpApplication.find(params[:id])
  end
  
  def update
	@nrp_application = NrpApplication.find(params[:id])
	if @nrp_application.update_attributes(params.require(:nrp_application).permit(:user_name, :email, :age))
		flash[:notice] = "Application updated successfully."
		redirect_to(:action => 'show', :id => @nrp_application.id)
	else
		render('edit')
	end
  end  

  def delete
	@nrp_application = NrpApplication.find(params[:id])
  end
  
  def destroy
	nrp_application = NrpApplication.find(params[:id]).destroy
	flash[:notice] = "Application '#{nrp_application.user_name}' deleted successfully."
	redirect_to(:action => 'index')
  end
end
