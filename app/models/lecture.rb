# frozen_string_literal: true

class Lecture < ApplicationRecord
  belongs_to :course
  belongs_to :user
end
