# => rake db:create_migration NAME=create_model
class CreateRequest < ActiveRecord::Migration
  def up
  	create_table :requests do |t|
  		t.string :uri
  		t.string :method
  		t.text :form_hash
  		t.text :form_vars
      t.text :raw
  	end
  end

  def down
  	drop_table :requests
  end
end
