require 'rails_helper'

RSpec.describe "companies/edit", type: :view do
  before(:each) do
    @company = assign(:company, Company.create!(
      :name => "MyString",
      :description => "MyText",
      :contactname => "MyString",
      :street => "MyString",
      :city => "MyString",
      :postcode => "MyString",
      :country => "MyString",
      :phone => "MyString",
      :email => "MyString",
      :homepage => "MyString"
    ))
  end

  it "renders the edit company form" do
    render

    assert_select "form[action=?][method=?]", company_path(@company), "post" do

      assert_select "input#company_name[name=?]", "company[name]"

      assert_select "textarea#company_description[name=?]", "company[description]"

      assert_select "input#company_contactname[name=?]", "company[contactname]"

      assert_select "input#company_street[name=?]", "company[street]"

      assert_select "input#company_city[name=?]", "company[city]"

      assert_select "input#company_postcode[name=?]", "company[postcode]"

      assert_select "input#company_country[name=?]", "company[country]"

      assert_select "input#company_phone[name=?]", "company[phone]"

      assert_select "input#company_email[name=?]", "company[email]"

      assert_select "input#company_homepage[name=?]", "company[homepage]"
    end
  end
end
