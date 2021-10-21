# frozen_string_literal: true

class GenderEnum < EnumerateIt::Base
  associate_values(
    'male',
    'female',
    'none'
  )
end
