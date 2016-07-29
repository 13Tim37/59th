class AlterUsers < ActiveRecord::Migration

  def up
	add_column("users", "admin", :bool, :after => "email")
	rename_column("users", "password", "hashed_password")
	puts "*** ADDING USERNAME INDEX ***"
	add_index("users", "user_name")
  end
  
  def down
	remove_index("users", "user_name")	
	rename_column("users", "hashed_password", "password")
	remove_column("users", "admin")	
  end
end
