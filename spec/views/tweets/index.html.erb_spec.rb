require 'rails_helper'

RSpec.describe "tweets/index", type: :view do
  before(:each) do
    assign(:tweets, [
      Tweet.create!(
        twett_content: "Twett Content"
      ),
      Tweet.create!(
        twett_content: "Twett Content"
      )
    ])
  end

  it "renders a list of tweets" do
    render
    assert_select "tr>td", text: "Twett Content".to_s, count: 2
  end
end
