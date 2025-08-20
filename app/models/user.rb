# User model with Devise authentication for garden management system
# Users can own multiple gardens and track their plant collections
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # File attachment: Users can have a profile photo via Active Storage
  has_one_attached :photo
  
  # Association: Users can own multiple gardens
  # When a user is destroyed, all their gardens are also removed
  has_many :gardens, dependent: :destroy
  
  # Association: Users have access to all plantations through their gardens
  has_many :plantations, through: :gardens
  
  # Association: Users can access all plants they've planted through plantations
  has_many :plants, through: :plantations

  # Theme preference validation
  validates :theme, inclusion: { in: %w[light dark], message: "must be either 'light' or 'dark'" }
end
