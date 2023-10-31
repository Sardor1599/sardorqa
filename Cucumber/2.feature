Feature: Cashback Calculation @cashback @target_age_18_45

  Scenario Outline: User makes a purchase, but branch is not participating in the promotion
    Given there is a Merchant with name [string]  #merchant_name
    Given there is a branch [string] for [string]  #merchant for branch
    And the click percentage for Merchant [tring] is [string]
    And there is a [string] promotion with "{10%}" discount only for [string]
    And the age target is [string]
    When a [string] user aged [string] makes a purchase of "<string>" UZS at the "<string>" branch
    Then the "<user_gender>" user aged "<user_age>" should not receive cashback, as the "<branch_name>" branch is not participating in the "<promotion_number>" promotion for "<gender>"
    And the click receives their "<click_percentage>" - "<click_amount>" UZS

 Where:
    ---------------------------------------
   | Target URL | Resulting URL | Page Title
   | cabinet    | /merchant     | Cabinet
   | users      | /resricted    | You dont have acces to this page


  Examples:

| merchant_name | branch_name | promotion_number | discount_percentage | gender       | percentage | age_range |
| Evos          | Moskva      | 3                | 10%                 | female       | 1%               | 18-45     |
