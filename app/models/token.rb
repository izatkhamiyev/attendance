class Token < ApplicationRecord
	has_many :users, dependent: :destroy

	before_create :gen_token

	private 
	def gen_token
		self.token = SecureRandom.urlsafe_base64
	end
end
