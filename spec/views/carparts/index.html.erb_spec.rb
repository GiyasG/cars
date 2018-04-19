require 'rails_helper'

RSpec.describe "carparts/index", type: :view do
  before(:each) do
    assign(:carparts, [
      Carpart.create!(
        :name => "Name",
        :code => "Code",
        :description => "Description",
        :detail => "Detail",
        :price => 2.5,
        :stock => 3,
        :reserved => 4,
        :sold => 5
      ),
      Carpart.create!(
        :name => "Name",
        :code => "Code",
        :description => "Description",
        :detail => "Detail",
        :price => 2.5,
        :stock => 3,
        :reserved => 4,
        :sold => 5
      )
    ])
  end

  it "renders a list of carparts" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Code".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => "Detail".to_s, :count => 2
    assert_select "tr>td", :text => 2.5.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => 5.to_s, :count => 2
  end
end
