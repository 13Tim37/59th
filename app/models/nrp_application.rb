class NrpApplication < ActiveRecord::Base

  scope :sorted, lambda { order("nrp_applications.id ASC") }  

end
