# frozen_string_literal: true

module Types
  class LectureType < Types::BaseObject
    description 'A lecture'
    field :id, ID, null: false
    field :title, String, null: false
    field :description, String, null: false
    field :video_link, String, null: true
    field :course, CourseType, null: false
    # TODO: Change this field to Uploaded by
    field :user, UserType, null: false
    field :visible_on, GraphQL::Types::ISO8601Date, null: false
  end
end
