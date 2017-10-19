require 'rails_helper'

describe Comment, type: :model do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without content" do
        comment = build(:comment, content: "")
        expect(comment).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with content and job" do
        job = build(:job)
        comment = build(:comment, job: job)
        expect(comment).to be_valid
      end
    end
  end

  describe "relationships" do
    it "belongs to a job" do
      comment = build(:comment)
      expect(comment).to respond_to(:job)
    end
  end
end
