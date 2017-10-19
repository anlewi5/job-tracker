require 'rails_helper'

describe Contact, type: :model do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without a first_name" do
        contact = build(:contact, first_name: "")
        expect(contact).to be_invalid
      end

      it "is invalid without a last_name" do
        contact = build(:contact, last_name: "")
        expect(contact).to be_invalid
      end

      it "is invalid without a position" do
        contact = build(:contact, position: "")
        expect(contact).to be_invalid
      end

      it "is invalid without a email" do
        contact = build(:contact, email: "")
        expect(contact).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with a first_name, last_name, position, email, and company" do
        company = build(:company)
        contact = build(:contact, company: company)
        expect(contact).to be_valid
      end
    end
  end

  describe "relationships" do
    it "belongs to a company" do
      contact = build(:contact)
      expect(contact).to respond_to(:company)
    end
  end
end
