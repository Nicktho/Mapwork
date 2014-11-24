class CreateControllers < ActiveRecord::Migration
  def change
    create_table :controllers do |t|
      t.string :name

      t.timestamps
    end
  end
end
