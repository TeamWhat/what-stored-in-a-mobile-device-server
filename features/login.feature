Feature: Login
    As a user I should be able to login

    Scenario: Login with correct credentials
        Given I am on the login page
        And There exists a user
	    And I fill in the correct username and password
	    When I press Sign in
	    Then I should see a success message

    Scenario: Login with incorrect password
	    Given I am on the login page
	    And I fill in an incorrect password
	    When I press Sign in
	    Then I should see a fail message

    Scenario: Login with incorrect username
	    Given I am on the login page
	    And I fill in an incorrect username
	    When I press Sign in
	    Then I should see a fail message
