class VoteSerializer < ActiveModel::Serializer
  attribute :id

  belongs_to :votable
  belongs_to :teacher
end
