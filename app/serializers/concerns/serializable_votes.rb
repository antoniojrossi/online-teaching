module SerializableVotes
  extend ActiveSupport::Concern

  included do
    has_many :votes do      
      meta do
        { count: @object.votes.count }
      end
    end
  end
end