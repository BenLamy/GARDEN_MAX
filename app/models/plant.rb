# Plant model representing different types of plants available for gardens
# Contains plant information like name, description and can be planted in multiple gardens
class Plant < ApplicationRecord
  # File attachment: Plants can have an associated photo via Active Storage
  has_one_attached :photo
  
  # Association: Plants can be planted in multiple plantations (instances in gardens)
  has_many :plantations
  
  # Association: Plants can exist in multiple gardens through the plantations join table
  has_many :gardens, through: :plantations
end
