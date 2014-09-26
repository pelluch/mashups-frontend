require 'rails_helper'

RSpec.describe "mash_ups/new", :type => :view do
  before(:each) do
    assign(:mash_up, MashUp.new())
  end

  it "renders new mash_up form" do
    render

    assert_select "form[action=?][method=?]", mash_ups_path, "post" do
    end
  end
end
