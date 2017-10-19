class Company < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  
  has_many :jobs, dependent: :destroy
  has_many :contacts, dependent: :destroy

  def self.average_interest_for_company
    Company.joins(:jobs)
           .group(:name)
           .average(:level_of_interest)
           .sort_by { |k, v| v }
           .reverse
  end
end
