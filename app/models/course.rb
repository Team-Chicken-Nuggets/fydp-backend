# frozen_string_literal: true

class Course < ApplicationRecord
  belongs_to :professor, class_name: 'User', optional: false
  has_many :enrollments, dependent: :destroy
  has_many :users, through: :enrollments
  has_many :lectures, dependent: :destroy
end
