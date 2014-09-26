require 'rails_helper'

RSpec.describe "mash_ups/index", :type => :view do
  before(:each) do
    assign(:mash_ups, [
      MashUp.create!(),
      MashUp.create!()
    ])
  end

  it "renders a list of mash_ups" do
    render
  end
end
