Feature: Simple Todo Web App
  As a personal user
  I want to manage my todos
  So that I can track tasks that need to be completed

  Background:
    Given I open the Todo application

  Scenario: Add todo item
    When I enter "Buy milk" in the input field
    And I press the Enter key
    Then I should see "Buy milk" in the list
    And the input field should be cleared

  Scenario: Add todo item - Using button
    When I enter "Complete report" in the input field
    And I click the add button
    Then I should see "Complete report" in the list
    And the input field should be cleared

  Scenario: Prevent adding empty todo
    When I don't enter any content
    And I press the Enter key
    Then no item should be added to the list
    And the input field remains empty

  Scenario: Mark todo as complete
    Given there is a todo "Learn React" in the list
    When I click the checkbox for that item
    Then the item should show as completed
    And the item should have strikethrough styling

  Scenario: Unmark completed todo
    Given there is a completed todo "Practice TypeScript" in the list
    When I click the checkbox for that item
    Then the item should show as incomplete
    And the item should not have strikethrough styling

  Scenario: Delete todo item
    Given there is a todo "Clean room" in the list
    When I click the delete button for that item
    Then the item should be removed from the list
    And "Clean room" should no longer be visible in the list

  Scenario: Data persistence - Page reload
    Given the list has the following todos:
      | Item        | Status     |
      | Write code  | Incomplete |
      | Exercise    | Complete   |
      | Read        | Incomplete |
    When I reload the page
    Then I should see the same todo list
    And each item's completion status should remain unchanged

  Scenario: Multiple todo operations
    When I add todo "Task one"
    And I add todo "Task two"
    And I add todo "Task three"
    And I mark "Task two" as complete
    And I delete "Task one"
    Then the list should only have "Task two" and "Task three"
    And "Task two" should show as completed
    And "Task three" should show as incomplete