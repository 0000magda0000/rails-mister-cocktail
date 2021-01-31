class Cocktail < ApplicationRecord
  has_many :doses, dependent: :delete_all
  has_many :ingredients, through: :doses, dependent: :delete_all
  validates :name, presence: true, uniqueness: true
  accepts_nested_attributes_for :ingredients, :doses
  has_one_attached :photo
  after_commit :add_default_photo, on: [:create, :update]

  def add_default_photo
    unless photo.attached?
      self.photo.attach(io: File.open(Rails.root.join("app", "assets", "images", "cocktail.jpg")), filename: 'cocktail.jpg', content_type: "image/jpg")
    end
  end
end
