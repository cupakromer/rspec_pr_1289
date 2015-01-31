require 'rails_helper'

RSpec.describe "test_view", :type => :view do

  it "renders the expected content" do
    render
    assert_select "p", :text => "This is a test."
  end
end
