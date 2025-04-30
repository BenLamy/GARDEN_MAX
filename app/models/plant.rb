class Plant < ApplicationRecord
  has_many :plantations
  has_many :gardens, through: :plantations
end
