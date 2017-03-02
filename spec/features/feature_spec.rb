require 'spec_helper'

# As two Players,
# So we can play a personalised game of Battle,
# We want to Start a fight by entering our names and seeing them
# Rspec.feature "User Stories", :type => :feature do
RSpec.feature 'initializing battle game with 2 players' do
  scenario 'allows players to enter their names and see them' do
    sign_in_and_play
    expect(page).to have_text("Player 1: Noora, Player 2: Alex")
  end
end
  # As Player 1,
  # So I can see how close I am to winning
  # I want to see Player 2's Hit Points
RSpec.feature 'recording hit points' do
  scenario 'shows player 2\'s hit points' do
    sign_in_and_play
    expect(page).to have_css("progress[value='65']")
  end
end
# As Player 1,
# So I can win a game of Battle,
# I want to attack Player 2, and I want to get a confirmation
RSpec.feature 'attacking' do
  scenario 'player 1 attacks player 2 and gets confirmation' do
    sign_in_and_play
    click_button 'player1_attack'
    expect(page).to have_content "Noora attacked Alex"
  end
end
