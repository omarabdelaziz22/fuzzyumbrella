require 'rails_helper'

RSpec.describe Favoritelist, type: :model do
  before :each do
    Favoritelist.destroy_all
    Product.destroy_all
  end
  subject { described_class.new ({user: User.new }) }

  it "has none to begin with" do
    expect(Favoritelist.count).to eq 0
  end

  it "has one after adding one" do
    subject.save
    expect(Favoritelist.count).to eq 1
  end

  it "has none after one was created in a previous example" do
    expect(Favoritelist.count).to eq 0
  end

  describe "Associations" do
    it "Belongs to user" do
      assc = described_class.reflect_on_association(:user)
      expect(assc.macro).to eq :belongs_to
    end

    it "has and belongs to many products" do
      assc = described_class.reflect_on_association(:products)
      expect(assc.macro).to eq :has_and_belongs_to_many
    end
  end

  describe "Validations" do
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "is not valid without a name"  do
      subject.user = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without a user"  do
      subject.user = nil
      expect(subject).to_not be_valid
    end
  end
end
