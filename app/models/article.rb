class Article < ApplicationRecord
	has_one_attached :main_image
	belongs_to :user
end
