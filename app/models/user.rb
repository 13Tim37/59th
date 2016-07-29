class User < ActiveRecord::Base
  
	has_secure_password
	
	scope :sorted, lambda { order("Users.id ASC") }  
  
end
