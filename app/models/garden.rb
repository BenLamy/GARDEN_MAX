class Garden < ApplicationRecord
  belongs_to :user

  has_many :plantations, dependent: :destroy
  has_many :plants, through: :plantations
  validates :name, presence: true, uniqueness: { scope: :user_id }
  validates :user_id, presence: true
  validates :user, presence: true
end
