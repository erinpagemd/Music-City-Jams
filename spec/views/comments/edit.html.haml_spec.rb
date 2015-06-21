require 'rails_helper'

RSpec.describe "comments/edit", type: :view do
  before(:each) do
    @comment = assign(:comment, Comment.create!(
      :reference => "",
      :reference => "",
      :body => "MyString"
    ))
  end

  it "renders the edit comment form" do
    render

    assert_select "form[action=?][method=?]", comment_path(@comment), "post" do

      assert_select "input#comment_reference[name=?]", "comment[reference]"

      assert_select "input#comment_reference[name=?]", "comment[reference]"

      assert_select "input#comment_body[name=?]", "comment[body]"
    end
  end
end
