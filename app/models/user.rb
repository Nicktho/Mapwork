# == Schema Information
#
# Table name: users
#
#  id                  :integer          not null, primary key
#  name                :string(255)
#  email               :string(255)
#  password_digest     :text
#  reputation          :integer
#  created_at          :datetime
#  updated_at          :datetime
#  avatar_file_name    :string(255)
#  avatar_content_type :string(255)
#  avatar_file_size    :integer
#  avatar_updated_at   :datetime
#  admin               :boolean
#

class User < ActiveRecord::Base
	has_many :mappings
	has_many :comments

	has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/default.jpg"
	validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

	has_secure_password

	validates :name, presence: true, uniqueness: true, length: {minimum: 3}
	validates :email, presence: true, uniqueness: true
	validates_length_of :password, in: 3..20, on: :create


	def self.add_reputation(user_id)
		user = self.find user_id 
		user.reputation ||= 0
		user.reputation += 1
		user.save
	end 

	def self.remove_reputation(user_id)
		user = self.find user_id 
		user.reputation ||= 0
		user.reputation -= 1
		user.save
	end 

	def total_downloads
		total = 0
		self.mappings.each do |map| 
			total += map.downloads || 0
		end 
		total
	end 
end
