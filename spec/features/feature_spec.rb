require 'spec_helper'

# As two Players,
# So we can play a personalised game of Battle,
# We want to Start a fight by entering our names and seeing them
# Rspec.feature "User Stories", :type => :feature do
RSpec.feature 'allows name entry' do
  scenario 'allows players to enter their names and see them' do
    visit "/battle/add_players"
    fill_in "player1", :with => "Noora"
    fill_in "player2", :with => "Alex"
    click_button "Submit"
    expect(page).to have_text("Player 1: Noora, Player 2: Alex")
  end

end
