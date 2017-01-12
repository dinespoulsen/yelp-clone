class Restaurant < ApplicationRecord
  validates :name, length: { minimum: 3 }, uniqueness: true

  has_many :reviews,
    -> { extending WithUserAssociationExtension },
    dependent: :destroy

  belongs_to :user

  def average_rating
     if reviews.any?
       reviews.inject(0) { |sum, review| sum + review.rating } / reviews.length.to_f
     else
       'N/A'
    end
  end
end
