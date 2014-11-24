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

require 'rails_helper'

RSpec.describe Image, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
