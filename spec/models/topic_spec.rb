require "rails_helper"

describe Topic do
  let(:topic) { Topic.new(topic: "recursion") }

  describe "attributes" do
    it "has a topic" do
      expect(topic.topic).to eq("recursion")
    end
  end

end
