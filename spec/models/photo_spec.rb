require 'rails_helper'

RSpec.describe Photo, type: :model do
  before {
    User.new(name: "test", email: "test@test.com")
  }

  describe "Validations" do
    it "is valid with valid attributes" do
      photo = Photo.new(
        name: "My Pic",
        date: DateTime.now.utc,
        caption: "Caption this",
        user: subject
      )
      expect(photo).to be_valid
    end
    it "is invalid without a name" do
      bad_photo = Photo.new(
        name: nil,
        date: DateTime.now.utc,
        caption: "Caption this",
        user: subject
      )
      expect(bad_photo).to_not be_valid
    end
    it "is invalid without an date" do
      bad_photo = Photo.new(
        name: "My Pic",
        date: nil,
        caption: "Caption this",
        user: subject
      )
      expect(bad_photo).to_not be_valid
    end
    it "is invalid without an caption" do
      bad_photo = Photo.new(
        bame: "My Pic",
        date: DateTime.now.utc,
        caption: nil,
        user: subject
      )
      expect(bad_photo).to_not be_valid
    end
    it "is invalid without a user" do
      bad_photo = Photo.new(
        name: "My Pic",
        date: DateTime.now.utc,
        caption: nil,
        user: nil
      )
      expect(bad_photo).to_not be_valid
    end
  end
  describe "Associations" do
    it "should have many photos" do
      assoc = Photo.reflect_on_association(:user)
      expect(assoc.macro).to eq :belongs_to
    end
  end
end
