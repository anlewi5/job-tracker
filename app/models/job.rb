class Job < ApplicationRecord
  validates :title,             presence: true
  validates :level_of_interest, presence: true
  validates :city,              presence: true
  validates :category,          presence: true

  belongs_to :company
  belongs_to :category
end
