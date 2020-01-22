class User < ApplicationRecord
	has_many :addresses

	def is_admin?
		self.email == "admin@example.com"
	end
end
