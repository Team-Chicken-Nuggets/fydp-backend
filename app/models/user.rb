# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :database_authenticatable, :token_authenticatable

  validates :first_name, :last_name, presence: true

  has_many :enrollments, dependent: :destroy
  has_many :courses, through: :enrollments

  has_many :teachings, class_name: 'Course', foreign_key: :professor_id, dependent: :destroy  # rubocop:disable Rails/InverseOf
  has_many :views, dependent: :destroy
  has_many :reactions, dependent: :destroy
end
