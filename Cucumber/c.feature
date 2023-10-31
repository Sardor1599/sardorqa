Gherkin
 @all
Feature: Cashback Calculation
  @cashback @female_user @target_age_18_45

@tag1 @tag2 @tag3 @tag4
  Scenario Outline: User makes a purchase, but click percentage is not applied
    Given there is a Merchant with name "<merchant_name>"
    Given there is a branch "<branch_name>" for "<merchant_name>"
    And there is a promotion with "<discount>" discount only for females
    And the click percentage for Merchant "<merchant_name>" is "<click_percentage>"
    And the age target is "<age_range>"
    When a user with phone number "<user_phone_number>" makes a transfer of "<transfer_amount>" UZS
    Then the user "<phone_number>" should "<cashback>"

    And there is a "<promotion_number>" promotion with "<discount_percentage>" discount only for "<gender>"

    Examples:
      | merchant_name | branch_name | discount | click_percentage | age_range | user_phone_number | transfer_amount | cashback |
      | "KFC"         | "Chilonzor" | "10%"    | 1                | "18-45"   | "998990005545"    | "15,000,000"    | should not receive cashback, as the click percentage does not apply to males |
      | "KFC"         | "Yunusabad"  | "15%"   | 1                | "18-45"   | "998990000101"    | "15,000,000"    | should receive 10% - 1,500,000 UZS cashback |


@tag2
Feature: Cashback Calculation @cashback @target_age_18_45


Feature: Cashback Calculation @cashback @target_age_18_45

  Scenario Outline: User makes a purchase, but branch is not participating in the promotion
    Given there is a Merchant with name "<merchant_name>"
    Given there is a branch "<branch_name>" for "<merchant_name>"
    And there is a "<promotion_number>" promotion with "<discount_percentage>" discount only for "<gender>"
    And the click percentage for Merchant "<merchant_name>" is "<click_percentage>"
    And the age target is "<age_range>"
    When a "<user_gender>" user aged "<user_age>" makes a purchase of "<purchase_amount>" UZS at the "<branch_name>" branch
    Then the "<user_gender>" user aged "<user_age>" should not receive cashback, as the "<branch_name>" branch is not participating in the "<promotion_number>" promotion for "<gender>"
    And the click receives their "<click_percentage>" - "<click_amount>" UZS


 Where:

   | Target URL | Resulting URL | Page Title
   | cabinet    | /merchant     | Cabinet
   | users      | /resricted    | You dont have acces to this page


  Examples:

| merchant_name | branch_name | promotion_number | discount_percentage   | gender       | click_percentage | age_range |
| Evos          | Tashkent      | 3                | 10%                 | female       | 1%               | 18-45     |


