class CreateNrpApplications < ActiveRecord::Migration
  def up
    create_table :nrp_applications do |t|
	  t.column "user_name", :string
	  t.column "email", :string
	  t.column "age", :string
      t.timestamps null: false
    end
  end
  
  def down
    drop_table :nrp_applications
  end
end
