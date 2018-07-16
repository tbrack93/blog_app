require "rails_helper"

RSpec.feature "View Article" do

  before do
    @article = Article.create(title: "Number 1", body: "Hello sir")
  end

  scenario "A user selects an article from index page" do
    visit "/"
    click_link "Number 1"
    expect(current_path).to eq(article_path(@article))
    expect(page).to have_content("Number 1")
    expect(page).to have_content("Hello sir")
  end
end
