# frozen_string_literal: true

module Mutations
  class CreateCourse < Mutations::BaseMutation
    argument :identifier, String, required: true
    argument :term, String, required: false
    argument :name, String, required: true
    argument :description, String, required: true
    argument :start_date, GraphQL::Types::ISO8601Date, required: true

    field :course, Types::CourseType, null: false

    def resolve(identifier:, term:, name:, description:, start_date:)
      return GraphQL::ExecutionError.new('User not logged in') if context[:current_user].nil?

      course = Course.create!(
        identifier: identifier,
        term: term,
        name: name,
        description: description,
        professor: context[:current_user],
        start_date: start_date
      )
      {
        course: course
      }
    end
  end
end
