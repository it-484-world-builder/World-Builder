Feature: User can add world
  
Scenario: add world
  
  Given I am on the Create New World page
  When I fill in "world_name" with "Forgotten Realems" save_and_open_page
  And I fill in "Description" with "Scary"
  And I fill in "GM Note" with "Happy"
  And I fill in "Character Note" with "Liars"
  And I press "Save Changes"
  Then I should be on the Worlds page
  And I should see "Forgotten Realems"