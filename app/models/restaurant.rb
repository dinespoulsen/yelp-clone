class Restaurant < ApplicationRecord
  validates :name, length: { minimum: 3 }, uniqueness: true

  has_many :reviews,
    -> { extending WithUserAssociationExtension },
    dependent: :destroy

  belongs_to :user

  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  def average_rating
     if reviews.any?
       reviews.average(:rating)
     else
       'N/A'
    end
  end
end
