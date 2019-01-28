require 'rails_helper'

RSpec.describe "favoritelists/new", type: :view do
  before(:each) do
    assign(:favoritelist, Favoritelist.new(
      :name => "MyString",
      :user => nil
    ))
  end

  it "renders new favoritelist form" do
    render

    assert_select "form[action=?][method=?]", favoritelists_path, "post" do

      assert_select "input[name=?]", "favoritelist[name]"

      assert_select "input[name=?]", "favoritelist[user_id]"
    end
  end
end
