class Communication < ApplicationRecord
  belongs_to :practitioner
  validates :practitioner, presence: true
  validates :sent_at, presence: true

  ## Why do we need that ?
  # def as_json(options = nil)
  #   {
  #     first_name: practitioner.first_name,
  #     last_name: practitioner.last_name,
  #     sent_at: sent_at
  #   }
  # end

end
