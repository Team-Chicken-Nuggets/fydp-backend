# frozen_string_literal: true

module Mutations
  class LogoutUser < Mutations::BaseMutation
    field :user, Types::UserType, null: true

    def resolve
      logout_user
    end

    private

    def logout_user
      user = context[:current_user]

      result = {
        user: nil
      }
      if user.present?
        user.reset_authentication_token!
        # remove the token from the cookie header
        context[:cookies].delete(:token, domain: 'http://localhost:8080')

        result[:user] = user
        result
      else
        GraphQL::ExecutionError.new('User not signed in')
      end
    end
  end
end
