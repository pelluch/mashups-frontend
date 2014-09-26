require 'rails_helper'

RSpec.describe "mash_ups/edit", :type => :view do
  before(:each) do
    @mash_up = assign(:mash_up, MashUp.create!())
  end

  it "renders the edit mash_up form" do
    render

    assert_select "form[action=?][method=?]", mash_up_path(@mash_up), "post" do
    end
  end
end
