class Tag < ApplicationRecord
  has_many :cocktail_tags, dependent: :destroy
  has_many :cocktails, through :cocktail_tags
end
