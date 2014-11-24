class AddIdsToMapping < ActiveRecord::Migration
  def change
  	add_column :mappings, :user_id, :integer
  	add_column :mappings, :controller_id, :integer
  	add_column :mappings, :software_id, :integer
  end
end
