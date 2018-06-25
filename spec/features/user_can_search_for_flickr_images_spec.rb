require "rails_helper"

describe "User visits root and can search for images" do
  it "renders search results from user search term" do
    visit root_path
    expect(page).to_not have_selector('img.search-result')
    expect(page).to_not have_content('displaying search results')

    fill_in "search_field", with: "cats"
    click_on "Find Images"

    expect(page).to have_content('displaying search results for cats')
    expect(page).to have_selector('img.search-result')
  end
end
