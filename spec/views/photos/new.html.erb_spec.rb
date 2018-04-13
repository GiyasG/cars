require 'rails_helper'

RSpec.describe "photos/new", type: :view do
  before(:each) do
    assign(:photo, Photo.new(
      :file => "MyString",
      :description => "MyString"
    ))
  end

  it "renders new photo form" do
    render

    assert_select "form[action=?][method=?]", photos_path, "post" do

      assert_select "input#photo_file[name=?]", "photo[file]"

      assert_select "input#photo_description[name=?]", "photo[description]"
    end
  end
end
