Feature: Exporting data
  As a user I should be able to export data to common formats

  Scenario: Logged in user can export data to csv
    Given I have logged in
    And There exists device info
    When I go to the subjects page
    Then I can export a csv file

  Scenario: Logged in user can export data to xls
    Given I have logged in
    And There exists image data
    When I go to the images page
    Then I can export an xls file

  Scenario: Cannot export data if not logged in
    Given There exists a user
    And There exists device info
    When I go to the subjects page
    And I have not logged in
    Then I can not export data
