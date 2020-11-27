# frozen_string_literal: true

module Types
  class UserType < Types::BaseObject
    description 'A user'
    field :id, ID, null: false
    field :first_name, String, null: false
    field :last_name, String, null: false
    field :email, String, null: false
    field :identifier, String, null: true
    field :role, String, null: true
    field :teachings, [CourseType], null: true
    field :courses, [CourseType], null: true
  end
end
