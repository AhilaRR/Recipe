class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :recipe

  # Validation example
  validates :content, presence: true
end
