require 'spec_helper'

feature "Nic Cage" do
  scenario "User sees the homepage" do
    visit "/"

    expect(page).to have_content "Cageflix"
    expect(page).to have_content "Netflix for Nic Cage movies"
  end

  scenario "User clicks Add Movie link to see form fields" do
    visit "/"

    click_link "Add Movie"
    expect(page).to have_content "Name"
    expect(page).to have_content "Year"
    expect(page).to have_content "Synopsis"
  end

  scenario "user can add movies successfully via the Add Movie form" do
    visit "/"
    click_link "Add Movie"
    fill_in "Name", :with => "Ghost Rider"
    fill_in "Year", :with => "2007"
    fill_in "Synopsis", :with => "I literally have no idea. A ghost with a motorcycle?"
    click_button "Create Movie"

    expect(page).to have_content "Ghost Rider"
    expect(page).to have_content "2007"
    expect(page).to have_content "I literally have no idea. A ghost with a motorcycle?"
  end

  scenario "user sees proper validations when doing form wrong" do
    visit "/"
    click_link "Add Movie"
    fill_in "Name", :with => ""
    fill_in "Year", :with => "2007"
    click_button "Create Movie"
    expect(page).to have_content "Name can't be blank"

    fill_in "Name", :with => "Ghost Rider"
    fill_in "Year", :with => ""
    click_button "Create Movie"
    expect(page).to have_content "Year can't be blank"

    fill_in "Name", :with => "Ghost Rider"
    fill_in "Year", :with => "the year two-thousand-seven"
    click_button "Create Movie"
    expect(page).to have_content "Year is not a number"
  end

  scenario "user sees films in the order in which they were made" do
    visit "/"
    click_link "Add Movie"
    fill_in "Name", :with => "Ghost Rider"
    fill_in "Year", :with => "2007"
    click_button "Create Movie"

    click_link "Add Movie"
    fill_in "Name", :with => "Gone in 60 Seconds"
    fill_in "Year", :with => "2000"
    click_button "Create Movie"

    click_link "Add Movie"
    fill_in "Name", :with => "National Treasure"
    fill_in "Year", :with => "2004"
    click_button "Create Movie"

    expect(page).to have_content "Ghost Rider (2007) National Treasure (2004) Gone in 60 Seconds (2000)"
  end

end