require "rails_helper"

describe Feedback do
  let(:feedback) { Feedback.new(rating: 5, comment: "awesomeness", pairing_id: 1, user_id: 1) }

  describe "attributes" do
    it "has a rating" do
      expect(feedback.rating).to eq(5)
    end
    it "has a comment" do
      expect(feedback.comment).to eq("awesomeness")
    end
    it "has a pairing_id" do
      expect(feedback.pairing_id).to eq(1)
    end
    it "has a user_id" do
      expect(feedback.user_id).to eq(1)
    end
  end

end
