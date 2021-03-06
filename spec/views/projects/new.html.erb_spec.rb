require 'rails_helper'

RSpec.describe "projects/new", type: :view do
  let(:admin) { Factory :admin }
  before(:each) do
    assign(:project, Project.new(
      :name => "MyString",
      :serial => "MyString",
      :category => nil
    ))
  end

  it "renders new project form" do
    sign_in admin
    render

    assert_select "form[action=?][method=?]", projects_path, "post" do

      assert_select "input#project_name[name=?]", "project[name]"

      assert_select "input#project_serial[name=?]", "project[serial]"

    end
  end
end
