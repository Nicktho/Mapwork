# == Schema Information
#
# Table name: controllers
#
#  id                  :integer          not null, primary key
#  name                :string(255)
#  created_at          :datetime
#  updated_at          :datetime
#  avatar_file_name    :string(255)
#  avatar_content_type :string(255)
#  avatar_file_size    :integer
#  avatar_updated_at   :datetime
#

class Controller < ActiveRecord::Base
	has_many :mappings
end
