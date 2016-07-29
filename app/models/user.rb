class User < ActiveRecord::Base
  
	has_secure_password
	
	scope :sorted, lambda { order('users.id ASC') }
  
end
