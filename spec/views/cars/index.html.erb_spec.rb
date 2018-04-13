require 'rails_helper'

RSpec.describe "cars/index", type: :view do
  before(:each) do
    assign(:cars, [
      Car.create!(
        :make => "Make",
        :model => "Model",
        :year => "",
        :body => "Body",
        :version => "Version",
        :classification => "Classification",
        :type => "Type",
        :door => 2,
        :seat => 3,
        :engineplace => "Engineplace",
        :drivetrain => "Drivetrain"
      ),
      Car.create!(
        :make => "Make",
        :model => "Model",
        :year => "",
        :body => "Body",
        :version => "Version",
        :classification => "Classification",
        :type => "Type",
        :door => 2,
        :seat => 3,
        :engineplace => "Engineplace",
        :drivetrain => "Drivetrain"
      )
    ])
  end

  it "renders a list of cars" do
    render
    assert_select "tr>td", :text => "Make".to_s, :count => 2
    assert_select "tr>td", :text => "Model".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "Body".to_s, :count => 2
    assert_select "tr>td", :text => "Version".to_s, :count => 2
    assert_select "tr>td", :text => "Classification".to_s, :count => 2
    assert_select "tr>td", :text => "Type".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => "Engineplace".to_s, :count => 2
    assert_select "tr>td", :text => "Drivetrain".to_s, :count => 2
  end
end
