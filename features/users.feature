Feature: user rights feature

  Scenario: User cannot claim email of another user
    When I try to update my profile info with:
      | address | 21 Greens Road RD 2 Ruawai 0592 |
      | email   | <%= user(1).email %>            |
    Then the operation should fail
    And the error message should contain "address <%= user(1).email %> already in use"
