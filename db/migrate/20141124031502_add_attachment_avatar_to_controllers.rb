class AddAttachmentAvatarToControllers < ActiveRecord::Migration
  def self.up
    change_table :controllers do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :controllers, :avatar
  end
end
