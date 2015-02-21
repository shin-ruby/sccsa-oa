require 'rails_helper'

RSpec.describe "notifications/index", type: :view do
  before(:each) do
    assign(:notifications, [
      Notification.create!(
        :user => nil,
        :content => "Content",
        :notificationable_type => "Notificationable Type",
        :notificationable_id => 1
      ),
      Notification.create!(
        :user => nil,
        :content => "Content",
        :notificationable_type => "Notificationable Type",
        :notificationable_id => 1
      )
    ])
  end

  it "renders a list of notifications" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Content".to_s, :count => 2
    assert_select "tr>td", :text => "Notificationable Type".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
