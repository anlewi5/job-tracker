class DashboardController < ApplicationController

  def index
    @jobs = Job.group_by_interest
    @companies = Company.average_interest_for_company
  end
end
