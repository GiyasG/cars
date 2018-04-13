require 'rails_helper'

RSpec.describe "cars/edit", type: :view do
  before(:each) do
    @car = assign(:car, Car.create!(
      :make => "MyString",
      :model => "MyString",
      :year => "",
      :body => "MyString",
      :version => "MyString",
      :classification => "MyString",
      :type => "",
      :door => 1,
      :seat => 1,
      :engineplace => "MyString",
      :drivetrain => "MyString"
    ))
  end

  it "renders the edit car form" do
    render

    assert_select "form[action=?][method=?]", car_path(@car), "post" do

      assert_select "input#car_make[name=?]", "car[make]"

      assert_select "input#car_model[name=?]", "car[model]"

      assert_select "input#car_year[name=?]", "car[year]"

      assert_select "input#car_body[name=?]", "car[body]"

      assert_select "input#car_version[name=?]", "car[version]"

      assert_select "input#car_classification[name=?]", "car[classification]"

      assert_select "input#car_type[name=?]", "car[type]"

      assert_select "input#car_door[name=?]", "car[door]"

      assert_select "input#car_seat[name=?]", "car[seat]"

      assert_select "input#car_engineplace[name=?]", "car[engineplace]"

      assert_select "input#car_drivetrain[name=?]", "car[drivetrain]"
    end
  end
end
