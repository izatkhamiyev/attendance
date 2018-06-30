class User < ApplicationRecord
	belongs_to :token, class_name: "Token"

	validates_presence_of :name, :surname, :token, :mac, :time
	validates_uniqueness_of :mac

end
