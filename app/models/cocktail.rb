class Cocktail < ApplicationRecord
  has_many :doses, dependent: :destroy
  has_many :reviews
  has_many :cocktail_tags, dependent: :destroy
  has_many :tags, through: :cocktail_tags
  has_one_attached :photo
  has_many :ingredients, through: :doses
  validates :name, presence: true, uniqueness: true
  validates :photo, presence: true
end
