# Plantation model - join table connecting gardens and plants with planting date
# Represents a specific instance of a plant being planted in a garden on a particular date
class Plantation < ApplicationRecord
  # Association: Each plantation belongs to a specific garden
  belongs_to :garden
  
  # Association: Each plantation is for a specific plant type
  belongs_to :plant
  
  # Validation: Plantation date must be present to track when the plant was added
  validates :date, presence: true
end
