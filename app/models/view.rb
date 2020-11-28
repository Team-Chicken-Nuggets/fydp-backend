# frozen_string_literal: true

class View < ApplicationRecord
  belongs_to :lecture
  belongs_to :user
end
