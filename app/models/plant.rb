class Plant < ApplicationRecord
  has_one_attached :photo
  has_many :plantations
  has_many :gardens, through: :plantations
end
