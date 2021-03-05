class Teacher < ApplicationRecord
  validates_presence_of :email
  validates :email, uniqueness: { case_sensitive: true }
end
