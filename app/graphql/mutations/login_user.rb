# frozen_string_literal: true

module Mutations
  class LoginUser < Mutations::BaseMutation
    argument :email, String, required: true
    argument :password, String, required: true

    field :token, String, null: true
    field :user, Types::UserType, null: true

    def resolve(email:, password:)
      login_user(email, password)
    end

    private

    def login_user(email, password)
      result = {
        token: nil,
        user: nil
      }
      user = User.find_for_database_authentication(email: email)
      if user.present?
        if user.valid_password?(password)
          result[:user] = user
          result[:token] = user.authentication_token
          result
        else
          GraphQL::ExecutionError.new('Incorrect Email/Password')
        end
      else
        GraphQL::ExecutionError.new('User not registered on this application')
      end
    end
  end
end
