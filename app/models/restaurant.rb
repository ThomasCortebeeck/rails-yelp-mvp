class Restaurant < ApplicationRecord
	has_many :reviews, dependent: :destroy 
	validates :address, :name, :category, presence: true 
	validates :phone_number, presence: true
	validates :name, uniqueness: true 
	validates :category, inclusion: { in: ["chinese", "italian", "japanese", "french", "belgian"] } 
end

# had to rails db:drop -> db:migrate
# yummy.restaurant = bristol  # Set foreign key restaurant_id
# bristol.reviews             # Should contain the yummy review
# yummy.restaurant            # Should return the bristol restaurant