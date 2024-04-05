class Profile < ApplicationRecord
  belongs_to :user

  # Validation examples
  validates :bio, length: { maximum: 500 }
  validates :website, format: { with: URI::regexp(%w[http https]) }, allow_blank: true
end
