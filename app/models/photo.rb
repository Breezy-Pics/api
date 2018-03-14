class Photo < ApplicationRecord
  belongs_to :user
  validates :name, :date, :caption, presence: true
end
