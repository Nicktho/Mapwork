# == Schema Information
#
# Table name: mappings
#
#  id            :integer          not null, primary key
#  name          :string(255)
#  description   :text
#  video         :string(255)
#  downloads     :integer
#  upvotes       :integer
#  downvotes     :integer
#  url           :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#  user_id       :integer
#  controller_id :integer
#  software_id   :integer
#

require 'rails_helper'

RSpec.describe Mapping, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
