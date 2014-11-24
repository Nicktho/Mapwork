class CreateMappings < ActiveRecord::Migration
  def change
    create_table :mappings do |t|
      t.string :name
      t.text :description
      t.string :video
      t.integer :downloads
      t.integer :upvotes
      t.integer :downvotes
      t.string :url

      t.timestamps
    end
  end
end
