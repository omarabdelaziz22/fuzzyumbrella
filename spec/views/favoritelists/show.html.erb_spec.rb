require 'rails_helper'

RSpec.describe "favoritelists/show", type: :view do
  before(:each) do
    @favoritelist = assign(:favoritelist, Favoritelist.create!(
      :name => "Name",
      :user => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(//)
  end
end
