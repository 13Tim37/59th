class AdminDefaultFalse < ActiveRecord::Migration
  def up
	change_column("users", "admin", :bool, :after => "email", :default => false)
  end
  
  def down
	change_column("users", "admin", :bool, :after => "email")
  end
end
