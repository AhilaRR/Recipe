class Category < ApplicationRecord
  has_many :categorizations, dependent: :destroy
  has_many :recipes, through: :categorizations

  # Validation example
  validates :name, presence: true, uniqueness: true
end
