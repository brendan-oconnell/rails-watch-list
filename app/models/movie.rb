class Movie < ApplicationRecord
  has_many :bookmarks

  # title is unique (FAILED - 3)
  # title cannot be blank (FAILED - 4)
  validates :title, uniqueness: true, presence: true
  # overview cannot be blank (FAILED - 5)
  validates :overview, presence: true
end
