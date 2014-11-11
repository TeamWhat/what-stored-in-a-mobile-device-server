Feature: Device info views
  As a user I should be able to view device info

  Scenario: Logged in user on the subjects page can see the device info
    Given I have logged in
    And There exists device info
    When I go to the subjects page
    Then I should see the device info

  Scenario: Cannot see other people's image data
    Given There exists a user
    And There exists device info
    When I go to the subjects page
    And I have not logged in
    Then I should not see the device info
