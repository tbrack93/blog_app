require "rails_helper"

RSpec.feature "Listing Articles" do

  before do
    @article1 = Article.create(title: "Number 1", body: "Hello sir")
    @article2 = Article.create(title: "Number 2", body: "Hello madam")
  end

  scenario "A user lists all articles" do
    visit "/"
    expect(page).to have_content("Number 1")
    expect(page).to have_link("Number 1")
    expect(page).to have_content("Hello sir")
    expect(page).to have_content("Number 2")
    expect(page).to have_link("Number 2")
    expect(page).to have_content("Hello madam")
  end

  scenario "A user has no articles" do

    Article.delete_all
    visit "/"
    expect(page).not_to have_content("Number 1")
    expect(page).not_to have_link("Number 1")
    expect(page).not_to have_content("Hello sir")
    expect(page).not_to have_content("Number 2")
    expect(page).not_to have_link("Number 2")
    expect(page).not_to have_content("Hello madam")

    within ("h3#no-articles") do
      expect(page).to have_content("No Articles Created")
    end
  end
end
