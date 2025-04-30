class Plantation < ApplicationRecord
  belongs_to :garden
  belongs_to :plant
  validates :date, presence: true
end
