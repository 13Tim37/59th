class CreateRecruitApplications < ActiveRecord::Migration
  def up
    create_table :recruit_applications do |t|
	  # add a foreign key to `articles.author_id` referencing `authors.id`
	  #add_foreign_key :Users, :user_name
	  #add_foreign_key :Users, :email
	  t.column "age", :string, :limit => 3
	  t.column "email", :string, :limit => 100
	  t.column "user_name", :string, :limit => 40
	  t.column "has_ts3", :bool
	  t.column "has_mic", :bool
	  t.column "steam_link", :string
	  t.column "country", :string
	  t.column "new_experience", :string
	  t.column "which_company", :int
	  t.column "join_reason", :text
	  t.column "vouch", :string
	  t.column "accept_code", :bool
	  t.column "application_status", :int, :default => 1
	  t.column "processed_by", :string, :default => ""

      t.timestamps null: false
    end
  end
  
  def down
    drop_table :recruit_applications
  end
end
