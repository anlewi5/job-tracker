class Job < ApplicationRecord
  validates :title,             presence: true
  validates :level_of_interest, presence: true
  validates :city,              presence: true
  validates :category,          presence: true

  belongs_to :company
  belongs_to :category
  has_many :comments, dependent: :destroy

  def self.group_by_interest
    Job.order(level_of_interest: :desc)
       .group(:level_of_interest)
       .count
  end
end
