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

class Mapping < ActiveRecord::Base
	belongs_to :user
	belongs_to :controller
	belongs_to :software 
	has_many :comments
	has_many :images

	validates :controller_id, presence: true
	validates :software_id, presence: true
	validates :user_id, presence: true
	validates :name, presence: true, length: {minimum: 3}
	validates :description, presence: true, length: {minimum: 3}
	validates :url, presence: true

	scope	:recent, -> {
		all.order(created_at: :desc)
	}
	scope :top_downloads, -> {
		all.order(downloads: :asc)
	}
	scope :highest_rated, -> {
		all.order(upvotes: :asc)
	}

	def upvote 
		self.upvotes ||= 0
		self.upvotes += 1
		self.save
		User.add_reputation(self.user_id)
	end 

	def downvote
		self.downvotes ||= 0
		self.downvotes += 1
		self.save
		User.remove_reputation(self.user_id)
	end 

	def download
		self.downloads ||= 0
		self.downloads += 1
		self.save
		User.add_reputation(self.user_id)
	end 


end
