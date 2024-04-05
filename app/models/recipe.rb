class Recipe < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :categorizations, dependent: :destroy
  has_many :categories, through: :categorizations

  # Validation examples
  validates :title, presence: true
  validates :ingredients, presence: true
  validates :instructions, presence: true
end
