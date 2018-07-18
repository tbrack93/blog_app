require "rails_helper"

RSpec.feature "Deleting an Article" do
  before do
    @article = Article.create(title: "An article", body: "Some text")
  end

  scenario "User deletes an article" do
    visit "/"
    click_link "An article"
    click_link "Delete Article"
    expect(page).to have_content("Article has been deleted")
    expect(current_path).to eq(articles_path)
  end
end
