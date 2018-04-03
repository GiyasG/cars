require 'rails_helper'

RSpec.describe "companies/index", type: :view do
  before(:each) do
    assign(:companies, [
      Company.create!(
        :name => "Name",
        :description => "MyText",
        :contactname => "Contactname",
        :street => "Street",
        :city => "City",
        :postcode => "Postcode",
        :country => "Country",
        :phone => "Phone",
        :email => "Email",
        :homepage => "Homepage"
      ),
      Company.create!(
        :name => "Name",
        :description => "MyText",
        :contactname => "Contactname",
        :street => "Street",
        :city => "City",
        :postcode => "Postcode",
        :country => "Country",
        :phone => "Phone",
        :email => "Email",
        :homepage => "Homepage"
      )
    ])
  end

  it "renders a list of companies" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Contactname".to_s, :count => 2
    assert_select "tr>td", :text => "Street".to_s, :count => 2
    assert_select "tr>td", :text => "City".to_s, :count => 2
    assert_select "tr>td", :text => "Postcode".to_s, :count => 2
    assert_select "tr>td", :text => "Country".to_s, :count => 2
    assert_select "tr>td", :text => "Phone".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Homepage".to_s, :count => 2
  end
end
