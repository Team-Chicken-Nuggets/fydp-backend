# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    # TODO: remove me
    field :test_field, String, null: false,
                               description: 'An example field added by the generator'
    field :login_user, mutation: Mutations::LoginUser
    field :logout_user, mutation: Mutations::LogoutUser
    field :register_user, mutation: Mutations::RegisterUser

    def test_field
      'Hello World'
    end
  end
end
