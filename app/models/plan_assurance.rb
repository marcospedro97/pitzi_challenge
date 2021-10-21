# frozen_string_literal: true

class PlanAssurance < ApplicationRecord
  belongs_to :plan
  belongs_to :assurance
end
