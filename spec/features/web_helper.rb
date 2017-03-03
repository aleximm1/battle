def sign_in_and_play
  visit "/battle/add_players"
  fill_in "player1", :with => "James"
  fill_in "player2", :with => "Alex"
  click_button "Submit"
end
