class User < ApplicationRecord
  has_many :photos
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
end
