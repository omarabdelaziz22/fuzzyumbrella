require 'rails_helper'

RSpec.describe "favoritelists/index", type: :view do
  before(:each) do
    assign(:favoritelists, [
      Favoritelist.create!(
        :name => "Name",
        :user => nil
      ),
      Favoritelist.create!(
        :name => "Name",
        :user => nil
      )
    ])
  end

  it "renders a list of favoritelists" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
