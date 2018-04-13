require 'rails_helper'

RSpec.describe "cars/show", type: :view do
  before(:each) do
    @car = assign(:car, Car.create!(
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
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Make/)
    expect(rendered).to match(/Model/)
    expect(rendered).to match(//)
    expect(rendered).to match(/Body/)
    expect(rendered).to match(/Version/)
    expect(rendered).to match(/Classification/)
    expect(rendered).to match(/Type/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/Engineplace/)
    expect(rendered).to match(/Drivetrain/)
  end
end
