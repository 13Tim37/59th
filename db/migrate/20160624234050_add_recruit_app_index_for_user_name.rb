class AddRecruitAppIndexForUserName < ActiveRecord::Migration
  def up
	add_index("recruit_applications", "user_name")
  end
  
  def down
	remove_index("recruit_applications", "user_name")
  end
end
