# == Schema Information
#
# Table name: images
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  url        :string(255)
#  created_at :datetime
#  updated_at :datetime
#  mapping_id :integer
#

class Image < ActiveRecord::Base
	belongs_to :mapping

	validates :url, presence: true
end
