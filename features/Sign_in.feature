Feature:Sign in existing users

  Scenario: Sign in
    Given I am on the website
    When I sign in
    Then I expect to see "Welcome to your account"