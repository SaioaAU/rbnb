class Dog < ApplicationRecord
  belongs_to :owner, class_name: "User", foreign_key: :user_id
  has_many :rentals, dependent: :destroy
  has_many :users, through: :rentals
  has_many_attached :photos
  validates :name, uniqueness: true, presence: true
  validates :age, presence: true
  validates :race, presence: true # multiple? blandings hund?
  validates :bio, presence: true
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
