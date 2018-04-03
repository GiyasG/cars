require 'rails_helper'

RSpec.describe "companies/show", type: :view do
  before(:each) do
    @company = assign(:company, Company.create!(
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
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Contactname/)
    expect(rendered).to match(/Street/)
    expect(rendered).to match(/City/)
    expect(rendered).to match(/Postcode/)
    expect(rendered).to match(/Country/)
    expect(rendered).to match(/Phone/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Homepage/)
  end
end
