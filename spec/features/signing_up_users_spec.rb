require "rails_helper"

RSpec.feature "Users signup" do
  scenario "with valid credentials" do
    visit "/"
    click_link "Sign Up"
    fill_in "Email", with: "Some@one.com"
    fill_in "Password", with: "password", match: :prefer_exact
    fill_in "Password confirmation", with: "password"
    click_button "Sign up"
    expect(page).to have_content("You have signed up successfully.")
  end

  scenario "with invalid credentials" do
    visit "/"
    click_link "Sign Up"
    fill_in "Email", with: ""
    fill_in "Password", with: "", match: :prefer_exact
    fill_in "Password confirmation", with: ""
    click_button "Sign up"
    expect(page).to have_content("Please review the problems below:")
  end
end
