class Recipe < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :categorizations, dependent: :destroy
  has_many :categories, through: :categorizations

  # Validation examples
  validates :title, presence: true
  validates :ingredients, presence: true
  validates :instructions, presence: true

  # Returns a comma-separated string of category names
  def categories_list
    self.categories.map(&:name).join(", ")
  end

  # Takes a comma-separated string, converts it to categories, and associates them with the recipe
  def categories_list=(value)
    # Split the string into an array of names, strip whitespace, and downcase for consistency
    category_names = value.split(",").map(&:strip).map(&:downcase).uniq
    # Find or create categories by name and associate them with the recipe
    self.categories = category_names.map do |name|
      Category.find_or_create_by(name: name)
    end
  end
end
