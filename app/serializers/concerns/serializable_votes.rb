module SerializableVotes
  extend ActiveSupport::Concern

  included do
    has_many :votes do      
      meta do
        { total_votes: @object.votes.count }
      end
    end
  end
end