require "rails_helper"

describe User do
  let(:user) {User.new(name: "user", email: "user@email.com", password: "password", phase: 3)}

  describe "attributes" do
    it "has a name" do
      expect(user.name).to eq("user")
    end
    it "has an email" do
      expect(user.email).to eq("user@email.com")
    end
    it "has a password" do
      expect(user.password).to eq("password")
    end
    it "has a phase" do
      expect(user.phase).to eq(3)
    end
  end

end
