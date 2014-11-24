# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  body       :text
#  created_at :datetime
#  updated_at :datetime
#  user_id    :integer
#  mapping_id :integer
#

class Comment < ActiveRecord::Base
	belongs_to :mapping
end
