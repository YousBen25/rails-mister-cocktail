class Cocktail < ApplicationRecord

  has_many :doses, dependent: :destroy
  has_many :reviews
  has_many :cocktail_tags, dependent: :destroy
  has_many :tags, through: :cocktail_tags
  has_one_attached :photo
  has_many :ingredients, through: :doses
  validates :name, presence: true, uniqueness: true
  # validates :photo, presence: true
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  include PgSearch::Model

  pg_search_scope :search_by_address,
    against: [:address],
    using: {
      tsearch: { prefix: true }
    }


  pg_search_scope :search_by_tag,
    against: [],
    associated_against: {
      tags: [:name]
    },

    using: {
      tsearch: {prefix: true}
  }
end
