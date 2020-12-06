# frozen_string_literal: true

module Mutations
  class CreateLecture < Mutations::BaseMutation
    argument :title, String, required: true
    argument :description, String, required: true
    argument :video_link, String, required: true
    argument :course_id, ID, required: true
    argument :visible_on, GraphQL::Types::ISO8601Date, required: true

    field :lecture, Types::LectureType, null: false

    def resolve(title:, description:, video_link:, course_id:, visible_on:)
      return GraphQL::ExecutionError.new('User not logged in') if context[:current_user].nil?

      lecture = Lecture.create!(
        title: title,
        description: description,
        video_link: video_link,
        course: Course.find(course_id),
        user: context[:current_user],
        visible_on: visible_on
      )
      {
        lecture: lecture
      }
    end
  end
end
