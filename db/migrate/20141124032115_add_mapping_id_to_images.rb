class AddMappingIdToImages < ActiveRecord::Migration
  def change
  	add_column :images, :mapping_id, :integer
  end
end
