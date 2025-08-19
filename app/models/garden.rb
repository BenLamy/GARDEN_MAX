# Garden model representing a user's garden space
# Each garden belongs to a user and can contain multiple plants through plantations
class Garden < ApplicationRecord
  # Association: Each garden belongs to a specific user
  belongs_to :user
  
  # File attachment: Gardens can have an associated photo via Active Storage
  has_one_attached :photo
  
  # Association: Gardens have many plantations (plant instances with dates)
  # When a garden is destroyed, all its plantations are also removed
  has_many :plantations, dependent: :destroy
  
  # Association: Gardens can have many different plants through the plantations join table
  has_many :plants, through: :plantations
  
  # Validation: Garden name must be present and unique within the user's gardens
  validates :name, presence: true, uniqueness: { scope: :user_id }
  
  # Validation: Ensure user_id is present (redundant with belongs_to but explicit)
  validates :user_id, presence: true
  
  # Validation: Ensure the associated user exists
  validates :user, presence: true
end
