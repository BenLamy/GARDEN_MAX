# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

# Create 10 plant entries with appropriate fields
plants = [
  {
    name: "Tomato - Roma",
    description: "Determinate variety with plum-shaped fruits, ideal for sauces and canning. Requires full sun and regular watering."
  },
  {
    name: "Lavender - English",
    description: "Fragrant perennial herb with purple flowers. Drought-tolerant once established, prefers well-drained soil."
  },
  {
    name: "Basil - Genovese",
    description: "Classic Italian variety with large tender leaves, perfect for pesto and Mediterranean dishes. Prefers warm conditions and consistent moisture."
  },
  {
    name: "Carrot - Nantes",
    description: "Sweet cylindrical carrots with rounded tips. Grows best in loose, sandy soil and cool weather conditions."
  },
  {
    name: "Strawberry - Everbearing",
    description: "Produces fruit throughout the growing season. Requires full sun and regular fertilizing for best yields."
  },
  {
    name: "Rosemary - Upright",
    description: "Aromatic evergreen shrub with needle-like leaves. Drought-resistant and thrives in sunny locations with well-draining soil."
  },
  {
    name: "Cucumber - English",
    description: "Long, seedless variety with thin skin. Requires trellising, consistent moisture, and warm temperatures."
  },
  {
    name: "Kale - Lacinato",
    description: "Also known as Dinosaur Kale. Dark blue-green leaves with a sweet, earthy flavor. Cold-hardy and becomes sweeter after frost."
  },
  {
    name: "Blueberry - Highbush",
    description: "Productive variety with large, sweet berries. Requires acidic soil, ample moisture, and winter chill hours for optimal fruiting."
  },
  {
    name: "Mint - Spearmint",
    description: "Vigorous perennial herb with aromatic leaves. Spreads rapidly, best grown in containers to control spread."
  }
]

# Add plants to the database
plants.each do |plant_attributes|
  Plant.create!(plant_attributes)
end

puts "Created #{plants.count} plants"
