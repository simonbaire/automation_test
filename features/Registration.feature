Feature:Registration of new user

  Scenario: Register a new user
    Given I am on the website
    And I have a new user profile
    When I create a new account
    Then I expect to see "Welcome to your account"