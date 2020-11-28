# frozen_string_literal: true

class Reaction < ApplicationRecord
  belongs_to :lecture
  belongs_to :user
end
