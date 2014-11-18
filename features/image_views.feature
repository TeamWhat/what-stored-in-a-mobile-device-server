Feature: Image views
  As a user I should be able to view image data

  Scenario: Logged in user on the images page can see the image data
    Given I have logged in
    And There exists image data
    When I go to the page of a collection
    Then I should see the image data

  Scenario: Cannot see data unless logged in
    Given There exists a user
    And There exists image data
    When I go to the page of a collection
    And I have not logged in
    Then I should not see the image data
