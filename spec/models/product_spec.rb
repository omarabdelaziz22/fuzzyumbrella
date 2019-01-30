require 'rails_helper'

RSpec.describe Product, type: :model do
  before :each do
    Product.destroy_all
    Favoritelist.destroy_all
    Category.destroy_all
  end

  subject { described_class.new ({name: "Laptop", price: 3000, category: Category.new }) }

  it "has none to begin with" do
    expect(Product.count).to eq 0
  end

  it "has one after adding one" do
    subject.save
    expect(Product.count).to eq 1
  end

  it "has none after one was created in a previous example" do
    expect(Product.count).to eq 0
  end

  describe "Associations" do
    it "Belongs to category" do
      assc = described_class.reflect_on_association(:category)
      expect(assc.macro).to eq :belongs_to
    end

    it "has and belongs to many products" do
      assc = described_class.reflect_on_association(:favoritelists)
      expect(assc.macro).to eq :has_and_belongs_to_many
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
      older_product = Product.create({name: "TV"})
      product = Product.create({name: older_product.name})
      expect(product).to_not be_valid
    end
  end
end
