require 'rails_helper'

RSpec.describe "carparts/new", type: :view do
  before(:each) do
    assign(:carpart, Carpart.new(
      :name => "MyString",
      :code => "MyString",
      :description => "MyString",
      :detail => "MyString",
      :price => 1.5,
      :stock => 1,
      :reserved => 1,
      :sold => 1
    ))
  end

  it "renders new carpart form" do
    render

    assert_select "form[action=?][method=?]", carparts_path, "post" do

      assert_select "input#carpart_name[name=?]", "carpart[name]"

      assert_select "input#carpart_code[name=?]", "carpart[code]"

      assert_select "input#carpart_description[name=?]", "carpart[description]"

      assert_select "input#carpart_detail[name=?]", "carpart[detail]"

      assert_select "input#carpart_price[name=?]", "carpart[price]"

      assert_select "input#carpart_stock[name=?]", "carpart[stock]"

      assert_select "input#carpart_reserved[name=?]", "carpart[reserved]"

      assert_select "input#carpart_sold[name=?]", "carpart[sold]"
    end
  end
end
