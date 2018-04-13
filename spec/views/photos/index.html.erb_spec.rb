require 'rails_helper'

RSpec.describe "photos/index", type: :view do
  before(:each) do
    assign(:photos, [
      Photo.create!(
        :file => "File",
        :description => "Description"
      ),
      Photo.create!(
        :file => "File",
        :description => "Description"
      )
    ])
  end

  it "renders a list of photos" do
    render
    assert_select "tr>td", :text => "File".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
  end
end
