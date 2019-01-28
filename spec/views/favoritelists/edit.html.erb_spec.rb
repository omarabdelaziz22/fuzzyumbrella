require 'rails_helper'

RSpec.describe "favoritelists/edit", type: :view do
  before(:each) do
    @favoritelist = assign(:favoritelist, Favoritelist.create!(
      :name => "MyString",
      :user => nil
    ))
  end

  it "renders the edit favoritelist form" do
    render

    assert_select "form[action=?][method=?]", favoritelist_path(@favoritelist), "post" do

      assert_select "input[name=?]", "favoritelist[name]"

      assert_select "input[name=?]", "favoritelist[user_id]"
    end
  end
end
