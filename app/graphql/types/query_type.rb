# frozen_string_literal: true

module Types
  class QueryType < GraphQL::Schema::Object
    description 'The query root of this schema'

    # First describe the field signature:
    field :user, UserType, null: true do
      description 'Find a user by ID'
      argument :id, ID, required: true
    end

    # Then provide an implementation:
    def user(id:)
      User.find(id)
    end
  end
end
