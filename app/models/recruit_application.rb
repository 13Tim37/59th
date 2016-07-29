class RecruitApplication < ActiveRecord::Base

	scope :sorted, lambda { order("recruit_applications.id ASC") }

	def self.sort_by_status(status)
		where("application_status LIKE ?", "%#{status}%")
	end

end
