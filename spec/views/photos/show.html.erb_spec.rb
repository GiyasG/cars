require 'rails_helper'

RSpec.describe "photos/show", type: :view do
  before(:each) do
    @photo = assign(:photo, Photo.create!(
      :file => "File",
      :description => "Description"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/File/)
    expect(rendered).to match(/Description/)
  end
end
