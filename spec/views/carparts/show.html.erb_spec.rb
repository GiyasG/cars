require 'rails_helper'

RSpec.describe "carparts/show", type: :view do
  before(:each) do
    @carpart = assign(:carpart, Carpart.create!(
      :name => "Name",
      :code => "Code",
      :description => "Description",
      :detail => "Detail",
      :price => 2.5,
      :stock => 3,
      :reserved => 4,
      :sold => 5
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Code/)
    expect(rendered).to match(/Description/)
    expect(rendered).to match(/Detail/)
    expect(rendered).to match(/2.5/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/4/)
    expect(rendered).to match(/5/)
  end
end
