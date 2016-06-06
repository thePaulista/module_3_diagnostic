#As a user
#When I visit "/"
#And I fill in the search form with 80203
#And I click "Locate"
#Then I should be on page "/search?zip=80203"
#Then I should see a list of the 10 closest stations within 6 miles sorted by distance
#And the stations should be limited to Electric and Propane
#And for each of the stations I should see Name, Address, Fuel Types, Distance, and Access Times

require 'rails_helper'

feature "User can search for stations with zipcode " do
  scenario "and locate 10 stations within a specific field " do
    VCR.use_cassette("locate_closest_station_by_field") do
      visit root_path

      fill_in "q", with: "80203"
      click_button "Locate"

      within ("li:first") do
        expect(page).to have_content("Name: fuel")
        expect(page).to have_content("Address: fuel")
        expect(page).to have_content("Fuel Type: fuel")
        expect(page).to have_content("Distance : fuel")
        expect(page).to have_content("Access Times : fuel")
      end
    end
  end
