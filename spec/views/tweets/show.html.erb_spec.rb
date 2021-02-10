require 'rails_helper'

RSpec.describe "tweets/show", type: :view do
  before(:each) do
    @tweet = assign(:tweet, Tweet.create!(
      twett_content: "Twett Content"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Twett Content/)
  end
end
