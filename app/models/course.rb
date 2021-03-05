class Course < ApplicationRecord
  validates_presence_of :title
  validates :title, uniqueness: { case_sensitive: true }
end
