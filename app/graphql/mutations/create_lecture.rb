# frozen_string_literal: true

module Mutations
  class CreateLecture < Mutations::BaseMutation
    argument :title, String, required: true
    argument :description, String, required: true
    argument :video_link, String, required: true
    argument :course_id, ID, required: true
    argument :user_id, ID, required: false
    argument :visible_on, GraphQL::Types::ISO8601Date, required: true

    field :lecture, Types::LectureType, null: false

    def resolve(title:, description:, video_link:, course_id:, visible_on:, user_id: nil) # rubocop:disable Metrics/ParameterLists
      lecture = Lecture.create!(
        title: title,
        description: description,
        video_link: video_link,
        course: Course.find(course_id),
        user: User.find(user_id),
        visible_on: visible_on
      )
      {
        lecture: lecture
      }
    end
  end
end
