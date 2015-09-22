#encoding: utf-8
Feature: Displays articles

  Scenario: Home Page
    Given the following articles
      | title      | author_ids | body | issue_num | year | dept_id | publish_date |
      | My Article | 1          | Hi   | 1         | 2016 | 1       | DateTime.now |
    When I go to the home page
    Then I get that article
