class RecruitApplication < ActiveRecord::Base

	scope :sorted, lambda { order("recruit_applications.id ASC") }  

end
