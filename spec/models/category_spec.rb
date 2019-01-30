require 'rails_helper'

RSpec.describe Category, type: :model do
  before :each do
    Category.destroy_all
  end
  subject { described_class.new ({name: "Electronics" }) }

  it "has none to begin with" do
    expect(Category.count).to eq 0
  end

  it "has one after adding one" do
    subject.save
    expect(Category.count).to eq 1
  end

  it "has none after one was created in a previous example" do
    expect(Category.count).to eq 0
  end

  describe "Associations" do
    it "has many products" do
      assc = described_class.reflect_on_association(:products)
      expect(assc.macro).to eq :has_many
    end
  end

  describe "Validations" do
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "is not valid without a name"  do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it "should has a unique name" do
      older_category = Category.create({name: "Electronics"})
      category = Category.create({name: older_category.name})
      expect(category).to_not be_valid
    end
  end
end
