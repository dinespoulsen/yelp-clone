class Restaurant < ApplicationRecord
  validates :name, length: { minimum: 3 }, uniqueness: true

  has_many :reviews,
    -> { extending WithUserAssociationExtension },
    dependent: :destroy

  belongs_to :user

  def average_rating
     if reviews.any?
       reviews.average(:rating)
     else
       'N/A'
    end
  end
end
