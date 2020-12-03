# frozen_string_literal: true

module Types
  class CourseType < Types::BaseObject
    description 'A course'
    field :id, ID, null: false
    field :identifier, String, null: false
    field :term, String, null: true
    field :name, String, null: false
    field :description, String, null: false
    field :professor, UserType, null: false
    # TODO: Change this field name to be students
    field :users, [UserType], null: false
    field :lectures, [LectureType], null: true
  end
end
