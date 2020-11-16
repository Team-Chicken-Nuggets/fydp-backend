# frozen_string_literal: true

module Mutations
  class RegisterUser < Mutations::BaseMutation
    argument :first_name, String, required: true
    argument :last_name, String, required: true
    argument :email, String, required: true
    argument :password, String, required: true

    field :user, Types::UserType, null: false

    def resolve(args)
      register_user(args)
    end

    private

    def register_user(args)
      user = User.create!(args)

      # current_user needs to be set so authenticationToken can be returned
      context[:current_user] = user

      {
        user: user
      }
    rescue ActiveRecord::RecordInvalid => e
      GraphQL::ExecutionError.new(
        "Invalid Attributes for #{e.record.class.name}: " \
        "#{e.record.errors.full_messages.join(', ')}"
      )
    end
  end
end
