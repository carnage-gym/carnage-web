require "rails_helper"

RSpec.describe Routine, type: :model do
  context "creation" do
    it "cannot have two routines with the same name" do
      expect {
        u = User.create!(email_address: "user@example.com", username: "test", password: "123456")
        u.routines.create!(name: "test123")
        u.routines.create!(name: "test123")
      }.to raise_error(ActiveRecord::RecordInvalid)
    end
  end
end
