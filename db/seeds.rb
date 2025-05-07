# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Room.find_or_create_by!(x: 2, y: 3) do |r|
  r.north_image = "1_north.jpg"
  r.south_image = "1_south.jpg"
  r.east_image = "1_east.jpg"
  r.west_image = "1_west.jpg"
end
Room.find_or_create_by!(x: 1, y: 3) do |r|
  r.north_image = "2_north.jpg"
  r.south_image = "2_south.jpg"
  r.east_image = "2_east.jpg"
  r.west_image = "2_west.jpg"
end
Room.find_or_create_by!(x: 2, y: 2) do |r|
  r.north_image = "3_north.jpg"
  r.south_image = "3_south.jpg"
  r.east_image = "3_east.jpg"
  r.west_image = "3_west.jpg"
end
Room.find_or_create_by!(x: 1, y: 2) do |r|
  r.north_image = "4_north.jpg"
  r.south_image = "4_south.jpg"
  r.east_image = "4_east.jpg"
  r.west_image = "4_west.jpg"
end
Room.find_or_create_by!(x: 2, y: 1) do |r|
  r.north_image = "5_north.jpg"
  r.south_image = "5_south.jpg"
  r.east_image = "5_east.jpg"
  r.west_image = "5_west.jpg"
end
Room.find_or_create_by!(x: 1, y: 1) do |r|
  r.north_image = "6_north.jpg"
  r.south_image = "6_south.jpg"
  r.east_image = "6_east.jpg"
  r.west_image = "6_west.jpg"
end