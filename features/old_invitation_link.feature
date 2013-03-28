Feature: Loomio user accepts an old invitation link
As a potential group admin
So that I can start a group
I want to be able accept an invitation link in the old format

Scenario: User accepts an invitation containing the old style link
  Given I have requested to start a loomio group
  And the group request has been approved
  When I click the old format invitation link to start a new group
  Then I should be asked to create an account
