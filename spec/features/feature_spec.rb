require 'spec_helper'

# As two Players,
# So we can play a personalised game of Battle,
# We want to Start a fight by entering our names and seeing them
# Rspec.feature "User Stories", :type => :feature do
RSpec.feature 'initializing battle game with 2 players' do
  scenario 'allows players to enter their names and see them' do
    visit "/battle/add_players"
    fill_in "player1", :with => "Noora"
    fill_in "player2", :with => "Alex"
    click_button "Submit"
    expect(page).to have_text("Player 1: Noora, Player 2: Alex")
  end
end
  # As Player 1,
  # So I can see how close I am to winning
  # I want to see Player 2's Hit Points
  RSpec.feature 'recording hit points' do
    scenario 'shows player 2\'s hit points' do
      visit "/battle/add_players"
      fill_in "player1", :with => "Noora"
      fill_in "player2", :with => "Alex"
      click_button "Submit"
      expect(page).to have_content 'Alex: 100HP'
    end
end
