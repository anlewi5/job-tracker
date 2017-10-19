require 'rails_helper'

describe Company do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without a name" do
        company = build(:company, name: "")
        expect(company).to be_invalid
      end

      it "has a unique name" do
        create(:company, name: "Dropbox")
        company = build(:company, name: "Dropbox")
        expect(company).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with a name" do
        company = build(:company)
        expect(company).to be_valid
      end
    end
  end

  describe "relationships" do
    it "has many jobs" do
      company = build(:company)
      expect(company).to respond_to(:jobs)
    end

    it "has many contacts" do
      company = build(:company)
      expect(company).to respond_to(:contacts)
    end
  end

  describe "class_methods" do
    describe ".average_interest_for_company" do
      it "returns an array of arrays with [company_name, avg_interest_level] in desc order" do
        company1 = create(:company, name: "one")
        company2 = create(:company, name: "two")
        company3 = create(:company, name: "three")

        category = create(:category)

        company1.jobs.create!(title: "Job", description: "Desc", level_of_interest: 1, city: "Den", category: category)
        company2.jobs.create!(title: "Job", description: "Desc", level_of_interest: 2, city: "Den", category: category)
        company2.jobs.create!(title: "Job", description: "Desc", level_of_interest: 4, city: "Den", category: category)
        company3.jobs.create!(title: "Job", description: "Desc", level_of_interest: 6, city: "Den", category: category)

        company_interest = [["three", 6], ["two", 3], ["one", 1]]
        expect(Company.average_interest_for_company).to eq(company_interest)
      end
    end
  end
end
