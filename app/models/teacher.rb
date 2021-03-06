class Teacher < ApplicationRecord
  has_many :voted_on, class_name: 'Vote', dependent: :destroy
  has_many :votes, as: :votable, dependent: :destroy

  validates_presence_of :email
  validates :email, uniqueness: { case_sensitive: true }
end
