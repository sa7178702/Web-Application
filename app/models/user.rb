class User < ApplicationRecord
	has_one_attached :main_image
	has_many :articles, dependent: :destroy

	
end
