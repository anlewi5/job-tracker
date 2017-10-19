require 'rails_helper'

describe Job do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without a title" do
        job = build(:job, title: "")
        expect(job).to be_invalid
      end

      it "is invalid without a level of interest" do
        job = build(:job, level_of_interest: "")
        expect(job).to be_invalid
      end

      it "is invalid without a city" do
        job = build(:job, city: "")
        expect(job).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with a title, level of interest, and company" do
        company = build(:company)
        job = build(:job, company: company)
        expect(job).to be_valid
      end
    end
  end

  describe "relationships" do
    it "belongs to a company" do
      job = build(:job)
      expect(job).to respond_to(:company)
    end

    it "belongs to a category" do
      job = build(:job)
      expect(job).to respond_to(:category)
    end

    it "has many comments" do
      job = build(:job)
      expect(job).to respond_to(:comments)
    end
  end

  describe "class_methods" do
    describe ".group_by_interest" do
      it "returns a hash {level_of_interest => count} in desc order" do
        create(:company, id: 1)
        create(:category, id: 1)
        Job.create!(title: "Job",
                    description: "Desc",
                    city: "Denver",
                    level_of_interest: 1,
                    company_id: 1,
                    category_id: 1)
        Job.create!(title: "Job",
                    description: "Desc",
                    city: "Denver",
                    level_of_interest: 1,
                    company_id: 1,
                    category_id: 1)
        Job.create!(title: "Job",
                    description: "Desc",
                    city: "Denver",
                    level_of_interest: 3,
                    company_id: 1,
                    category_id: 1)
        Job.create!(title: "Job",
                    description: "Desc",
                    city: "Denver",
                    level_of_interest: 3,
                    company_id: 1,
                    category_id: 1)
        Job.create!(title: "Job",
                    description: "Desc",
                    city: "Denver",
                    level_of_interest: 3,
                    company_id: 1,
                    category_id: 1)
        Job.create!(title: "Job",
                    description: "Desc",
                    city: "Denver",
                    level_of_interest: 5,
                    company_id: 1,
                    category_id: 1)

        job_interest_count = { 3 => 3, 1 => 2, 5 => 1}
        expect(Job.group_by_interest).to eq(job_interest_count)
      end
    end
  end
end
