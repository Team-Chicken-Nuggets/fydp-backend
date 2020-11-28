# frozen_string_literal: true

class Lecture < ApplicationRecord
  belongs_to :course
  belongs_to :user
  has_many :views, dependent: :destroy
  has_many :reactions, dependent: :destroy
end
