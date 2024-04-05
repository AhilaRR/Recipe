class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :recipes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_one :profile, dependent: :destroy

  # Indirect association with categories through recipes
  has_many :categories, through: :recipes

  after_create :create_user_profile

  private

  def create_user_profile
    Profile.create(user: self)
  end
end
