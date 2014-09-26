require 'rails_helper'

RSpec.describe "mash_ups/show", :type => :view do
  before(:each) do
    @mash_up = assign(:mash_up, MashUp.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
