class CreateUsers < ActiveRecord::Migration
  def up
    create_table :users do |t|
	  t.column "user_name", :string, :limit => 32, :null => false
	  t.column "email", :string, :default => "", :null => false, :limit => 100
	  t.column "password", :string, :limit => 50, :null => false
      t.timestamps null: false
    end
  end
  
  def down
	drop_table :users
  end
end
