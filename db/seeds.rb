# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Room.create(x: 1, y: 1, north_image: 'north_0_0.jpg', south_image: 'south_0_0.jpg',
            east_image: 'east_0_0.jpg', west_image: 'west_0_0.jpg')
Room.create(x: 1, y: 2, north_image: 'north_0_1.jpg', south_image: 'south_0_1.jpg',
            east_image: 'east_0_1.jpg', west_image: 'west_0_1.jpg')