class CocktailTag < ApplicationRecord
  belongs_to :cocktail
  belongs_to :tag
  validates :cocktail, uniqueness: {  scope: :tag,
                                      message: "You can't add several times same tag" }
end
