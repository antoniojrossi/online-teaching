class Course < ApplicationRecord
  has_many :votes, as: :votable, dependent: :destroy

  validates_presence_of :title
  validates :title, uniqueness: { case_sensitive: true }
end
