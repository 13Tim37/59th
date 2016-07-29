class AddAdminUserAccount < ActiveRecord::Migration
  def up
	tim = User.new(:user_name => 'TopHatTim', :password => 'Testpassword321', :email => '13tim37@gmail.com', :admin => true)
	if tim.save
		puts "*** ADMIN ACCOUNT CREATED ***"
	else
		puts "*** ADMIN ACCOUNT FAILED ***"
	end
  end
  
  def down
	tim = User.find_by_user_name('TopHatTim')
	tim.destroy
	puts "*** ADMIN ACCOUNT DELETED ***"	
  end
end
