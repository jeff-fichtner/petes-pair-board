require "rails_helper"

describe Pairing do
  let(:pairing) { Pairing.new(start_time: "2016-10-07 09:03:00", mentor_id: 1, student_id: 1) }

  describe "attributes" do
    it "has a start_time" do
      expect(pairing.start_time).to eq("2016-10-07 09:03:00")
    end
    it "has a mentor_id" do
      expect(pairing.mentor_id).to eq(1)
    end
    it "has a student_id" do
      expect(pairing.student_id).to eq(1)
    end
  end

end
