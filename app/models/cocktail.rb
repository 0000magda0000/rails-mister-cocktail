class Cocktail < ApplicationRecord
  has_many :doses, dependent: :delete_all
  has_many :ingredients, through: :doses, dependent: :delete_all
  validates :name, presence: true, uniqueness: true
  accepts_nested_attributes_for :ingredients, :doses
  has_one_attached :photo
end
