class RecruitApplicationsController < ApplicationController
  
  before_action :confirm_logged_in, :except =>[:new, :create]
  before_action :check_if_admin, :except =>[:new, :create, :edit, :update]
  
  def index
    @recruit_applications = RecruitApplication.sorted

    if params[:status_filter] && params[:status_filter] != ''
      if params[:status_filter] == 'Declined'
        status = 0
      elsif params[:status_filter] == 'In progress'
        status = 1
      elsif params[:status_filter] == 'Accepted'
        status = 2
      elsif params[:status_filter] == 'Archived'
        status = 3
      end
      @recruit_applications = @recruit_applications.sort_by_status(status)
    end
  end

  def show
    @recruit_application = RecruitApplication.find(params[:id])
  end

  def new
    @recruit_application = RecruitApplication.new
  end
  
  def create
	# Instantiate a new object using form parameters
	@recruit_application = RecruitApplication.new(params.require(:recruit_application).permit(:user_name, :email, :age, :has_ts3, :has_mic, :steam_link, :country, :new_experience, :which_company, :join_reason, :vouch))

  # Save the object
	if @recruit_application.save
	# If save succeeds, redirect to the index action
		flash[:notice] = "Application created successfully."
		redirect_to(:controller => 'page', :action => 'index')
	else
	# If save fails, redisplay the form so user can fix problems
		render('new')
	end
  end

  def edit
	  @recruit_application = RecruitApplication.find(params[:id])
  end
  
  def update
	  @recruit_application = RecruitApplication.find(params[:id])
	  if @recruit.update_attributes(params.require(:recruit_application).permit(:user_name, :email, :age))
		  flash[:notice] = "Application updated successfully."
		  redirect_to(:action => 'show', :id => @recruit_application.id)
	  else
		  render('edit')
	  end
  end  

  def delete
	  @recruit_application = RecruitApplication.find(params[:id])
  end
  
  def destroy
	  recruit_application = RecruitApplication.find(params[:id]).destroy
	  flash[:notice] = "Application '#{recruit_application.user_name}' deleted successfully."
	  redirect_to(:action => 'index')
  end
  
  def accept
    @recruit_application = RecruitApplication.find(params[:id])
    @recruit_application.application_status = 2
    if @recruit_application.save
      flash[:notice] = "*** Application accepted. ***"
      puts "*** APPLICATION ACCEPTED ***"
      puts 'New status: ' + @recruit_application.application_status.to_s
      render('index')
    else
      redirect_to(:action => 'show', :id => @recruit_application.id)
    end
  end
  
  def decline
    @recruit_application = RecruitApplication.find(params[:id])
    @recruit_application.application_status = 0
    if @recruit_application.save
      flash[:notice] = "*** Application declined. ***"
      puts "*** APPLICATION DECLINED ***"
      puts 'New status: ' + @recruit_application.application_status.to_s
      render('index')
    else
      redirect_to(:action => 'show', :id => @recruit_application.id)
    end
  end
   
end