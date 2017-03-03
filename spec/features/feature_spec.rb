require 'spec_helper'

# As two Players,
# So we can play a personalised game of Battle,
# We want to Start a fight by entering our names and seeing them
# Rspec.feature "User Stories", :type => :feature do
RSpec.feature 'initializing battle game with 2 players' do
  scenario 'allows players to enter their names and see them' do
    sign_in_and_play
    expect(page).to have_text("Player 1: James, Player 2: Alex")
  end
end
  # As Player 1,
  # So I can see how close I am to winning
  # I want to see Player 2's Hit Points
RSpec.feature 'recording hit points' do
  scenario 'shows player 2\'s hit points' do
    sign_in_and_play
    expect(page).to have_css("progress[value='100']")
  end
end
# As Player 1,
# So I can win a game of Battle,
# I want to attack Player 2, and I want to get a confirmation
RSpec.feature 'attacking' do
  scenario 'player 1 attacks player 2 and gets confirmation' do
    sign_in_and_play
    click_button 'Attack'
    expect(page).to have_content "James attacked Alex"
  end

  scenario 'player 2\'s hp is reduced by 10 when player 1 attacks' do
    sign_in_and_play
    click_button 'Attack'
    expect(page).to have_css('progress[value="90"][name="Alex_hp_bar"]')
    expect(page).to have_content "Alex: 90HP"
    expect(page).not_to have_content "Alex: 100HP"
  end

  scenario 'player 1\'s hp is reduced by 10 when player 2 attacks' do
    sign_in_and_play
    click_button 'Attack'
    click_button 'Attack'
    expect(page).to have_css('progress[value="90"][name="James_hp_bar"]')
    expect(page).to have_content "James: 90HP"
    expect(page).not_to have_content "James: 100HP"
  end
end

RSpec.feature 'switching turn' do
  scenario 'the page tells us whose turn it is' do
    sign_in_and_play
    expect(page).to have_content "James' turn"
  end

  scenario 'the page tells us about the turn switch for Alex' do
    sign_in_and_play
    click_button 'Attack'
    expect(page).to have_content "Alex's turn"
  end
end

RSpec.feature 'losing/winning' do
  scenario 'James wins/Alex loses' do
    sign_in_and_play
    18.times { click_button 'Attack' }
    expect(page).to have_css('progress[value="10"][name="Alex_hp_bar"]')
    expect(page).not_to have_content "James won, Alex lost."
    click_button 'Attack'
    expect(page).to have_content "James won, Alex lost."
  end
end
