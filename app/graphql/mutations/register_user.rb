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

      context[:cookies][:token] = {
        value: user.authentication_token,
        expires: 1.week.from_now,
        domain: 'http://localhost:8080',
        secure: true,
        httponly: true
      }

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
