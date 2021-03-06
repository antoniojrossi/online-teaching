class Vote < ApplicationRecord
  belongs_to :teacher
  belongs_to :votable, polymorphic: true

  validates_uniqueness_of :teacher, scope: [:votable_id, :votable_type]
end
