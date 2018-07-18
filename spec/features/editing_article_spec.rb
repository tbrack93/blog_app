require "rails_helper"

RSpec.feature "Editing an article" do
  before do
    @article = Article.create(title: "hello", body: "I'm an article")
  end

  scenario "A user updates an article" do
    visit "/"
    click_link "hello"
    click_link "Edit Article"
    fill_in "Title", with: "Updated Article"
    fill_in "Body", with: "New body"
    click_button "Update Article"
    expect(page).to have_content("Article has been updated")
    expect(page.current_path).to eq(article_path(@article))
  end

  scenario "User fails to update an article" do
    visit "/"
    visit "/"
    click_link "hello"
    click_link "Edit Article"
    fill_in "Title", with: ""
    fill_in "Body", with: "New body"
    click_button "Update Article"
    expect(page).to have_content("Article has not been updated")
    expect(current_path).to eq(article_path(@article))
  end

end
