class Restaurant < ApplicationRecord
  validates :name, length: { minimum: 3 }, uniqueness: true

  has_many :reviews,
    -> { extending WithUserAssociationExtension },
    dependent: :destroy

  belongs_to :user

end
