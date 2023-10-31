Gherkin
 @all
Feature: Cashback Calculation
  @cashback @female_user @target_age_18_45

@tag1 @tag2 @tag3 @tag4 @tag5 @tag6 @tag7 @tag8 @tag9 @tag10

    @tag1
  Scenario Outline: User makes a purchase, but click percentage is not applied
    Given there is a Merchant with name "<merchant_name>"
    #there is a Merchant with
    Given there is a branch "<branch_name>" for "<merchant_name>"
    #there is a Branch ... for Merchant ...
    And there is a promotion with "<discount_percentage>" discount only for females
    #there is a Promotion with  .... discount  only for females
    And the click percentage for Merchant "<merchant_name>" is "<click_percentage>"
    #the click percentage for Merchant ... is click %
    And the age target is "<age_range>"
    #the age target is ...
    When a user with phone number "<phone_number>" makes a transfer of "<user_amount>" UZS
    Then the user "<phone_number>" should "<cashback>"

    And there is a "<promotion_number>" promotion with "<discount_percentage>" discount only for "<gender>"

    Examples:
      | merchant_name | branch_name | discount_percentage | click_percentage | age_range | phone_number      | user_amount   | click_amount |promotion_number|gender  |  cashback                                                                   |
      | "KFC"         | "Chilonzor" | "10%"               | 1                | "18-45"   | "998990005545"    | "15,000,000"  | 10.000       |1               | male   | should not receive cashback, as the click percentage does not apply to males|
      | "KFC"         | "Yunusabad" | "15%"               | 1                | "18-45"   | "998990000101"    | "15,000,000"  | 5.000        |                | female | should receive 10% - 1,500,000 UZS cashback |


@tag2

Feature: Cashback Calculation cashback target_age_18_45

  Scenario Outline: User makes a purchase, but branch is not participating in the promotion
    Given there is a Merchant with name "<merchant_name>"
    Given there is a branch "<branch_name>" for "<merchant_name>"
    And there is a "<promotion_number>" promotion with "<discount_percentage>" discount only for "<gender>"
    And the click percentage for Merchant "<merchant_name>" is "<click_percentage>"
    And the age target is "<age_range>"
    When a "<gender>" user aged "<age_range>" makes a purchase of "<user_amount>" UZS at the "<branch_name>" branch
    Then the "<gender>" user aged "<age_range>" should not receive cashback, as the "<branch_name>" branch is not participating in the "<promotion_number>" promotion for "<gender>"
    And the click receives their "<click_percentage>" - "<click_amount>" UZS


 Where:

   | Target URL | Resulting URL | Page Title
   | cabinet    | /merchant     | Cabinet
   | users      | /resricted    | You dont have acces to this page


  Examples:

| merchant_name | branch_name | promotion_number | discount_percentage   | gender       | click_percentage | age_range |click_amount| user_amount |
| Evos          | Tashkent      | 3              | 10%                   | female         | 1%             | 18-45     |50.000      | 1200,0000   |

@tag3

Feature: User makes a purchase, but branch is not participating in the promotion

  Scenario Outline:

     When a "<gender>" user aged "<age_range>" makes a purchase of "<user_amount>" UZS at the "<branch_name>" branch

       #A female user aged 30 makes a purchase of "12,000,000" UZS at the "Yunusabad" branch

     Then the "<gender>" user aged "<age_range>" should not receive cashback, as the "<branch_name>" branch is not participating in the "<promotion_number>" promotion for "<gender>">"

       #user female aged 30 should not receive cashback, as the "Yunusabad" branch is not participating in the promotion for females

     Then the user "<gender>" should {should not receive cashback, as the click percentage does not apply to males}

       #the male user aged 30 should not receive cashback, as the "Yunusabad" branch is not participating in the discount campaign for males

     And the click receives their "<click_percentage>" - "<click_amount>" UZS

       #the click receives their 1% - 120,000 UZS


     Where:

   | Target URL | Resulting URL | Page Title
   | cabinet    | /merchant     | Cabinet
   | users      | /resricted    | You dont have acces to this page


      Examples:

| merchant_name | branch_name | promotion_number | discount_percentage  | gender       | click_percentage | age_range    |  click_amount |user_amount|
| Evos          | Tashkent    | 3                | 10%                  | female       | 1%               | 18-45        |  10.000       | 1200,0000 |
| Dodo Pizza    | Nazarbek    | 4                | 20%                  | male         | 1%               | 25-35        |  5.000        | 500.000   |
| MaxWay        | NEXT        | 5                | 5%                   | female       | 1%               | "<age_range>"|
| Bellissimo    | Yunusabad   | 6                | 15%                  | male         | 1%               | "<age_range>"|


@tag4 @cashback

Feature: User makes a purchase, but the purchase amount is below the minimum
  Scenario Outline:

    And there is a promotion with "<discount_percentage>" discount for all users

      #there is a promotion with "20%" discount for all users

    And the click percentage for Merchant "<branch_name>" is "<merchant_name>"

      #the click percentage for Merchant "Evos" is 1%
    And the minimum purchase amount for promotion is "<click_amount>"

      #the minimum purchase amount for promotion  is "1,000,000" UZS
    When a user with phone number "<phone_number>" makes a transfer of "<user_amount>" UZS at the "<branch_name>" branch
    
      #a user with phone number "998990007777" makes a purchase of "800,000" UZS at the "Mirobod" branch
    
    Then the user "<phone_number>" should {should not receive cashback, as the purchase amount is below the minimum}
      
        #the user "998990007777" should not receive cashback, as the purchase amount is below the minimum
    
    Then the click receives their "<click_percentage>" - "<click_amount>" UZS
         #the click receives their 1% - 8,000 UZS


          Examples:

| merchant_name | branch_name | promotion_number | discount_percentage  | gender       | click_percentage | age_range  | user_amount  |click_amount|
| Evos          | Tashkent    | 3                | 10%                  | female       | 1%               | 18-45      | 1200.0000    |10.000      |
| Dodo Pizza    | Nazarbek    | 4                | 20%                  | male         | 1%               | 25-35      | 500.000      |50.000      |
| MaxWay        | NEXT        | 5                | 5%                   | female       | 1%               |            |
| Bellissimo    | Yunusabad   | 6                | 15%                  | male         | 1%               |            |
| KFC           | Magic City  | 7                | 10%                  | female       | 1%               |            |
| Syndicate     | Anhor       | 8                | 10%                  | female       | 1%               |            |


@tag5 @cashback

Feature: Cashback Calculation


  Scenario Outline: User makes a purchase, but the branch is not participating in the promotion

    And there is a promotion with "<discount_percentage>" discount only for "<gender>"

    #there is a discount promotion with "15%" discount for all users

    And the click percentage for Merchant "<merchant_name>" is "<click_percentage>"%

    #the click percentage for Merchant "Evos" is 1%

    And the minimum amount for promotion is "<user_amount>"

    #the minimum purchase amount for promotion  is "5,000,000" UZS

    When a "<gender>" user with phone number "<phone_number>" makes a purchase of "<user_amount>" UZS at the "<branch_name>" branch
    #a male user with phone number "998990120101" makes a purchase of "6,000,000" UZS at the "Yunusabad" branch
    Then the user "<phone_number>" should receive "<discount_percentage>" - "<user_amount>" UZS cashback
    #the user "998990003333" should receive a cashback of 900,000 UZS (15% of the purchase amount)

    Examples:

    | merchant_name | branch_name | promotion_number | discount_percentage     | gender       | click_percentage | age_range | user_amount|click_amount|phone_number|
    | Evos          | Tashkent    | 3                | 10%                     | female       | 1%               | 18-45     | 300.000    | 10.000     |998902400000|

  @tag6 @cashback

Feature:Cashback Calculation

    Scenario Outline:   Scenario: User makes a purchase, but does not receive cashback and discount due to the absence of a promotion  and inappropriate branch

    And not announced <promotion_number> at a discounted price

    #Not Announced promotion at a discounted price
    And the click percentage for Merchant "<merchant_name>" is "<click_percentage>"%

    #the click percentage for Merchant "Evos" is 1%

    When a "<gender>" user  makes a purchase of "<phone_number>" UZS at the "<branch_name>" branch

    #a male user with phone number "998990000101" makes a purchase of "9,000,000" UZS at the "Yunusabad" branch

    Then the user should not receive cashback and discount, as there is no promotion declared and the "Yunusabad" branch is not participating in any campaign
    Then the click receives their "<click_perchentage>" - "<user_amount>" UZS

    Examples:

    | merchant_name | branch_name | promotion_number | discount_percentage | gender       | click_percentage | age_range | user_amount|click_amount|phone_number|
    | Evos          | Tashkent    | 3                | 10%                 | female       | 1%               | 18-45     | 300.000    | 10.000     |998902400000|



 @tag7
   Feature: Cashback Calculation
  @cashback
  Scenario Outline: User receives cashback only on a specific day of the week
    Given there is a discount campaing with "<discount_percentage>" discount for all users
    And the click percentage for Merchant "<merchant_name>" is "<click_percentage>"%
    But the minimum purchase amount for promotion  is "<click_amount>" UZS
    And the age target is "<age_range>"
    But the campaing is only available is "<day>"
    When a "<gender>" user aged "<age_range>" makes a purchase of "<click_amount>" UZS at the "<branch_name>" branch
    Then the user "<string>" should receive <string> - <click_amount> UZS cashback
    Then the click receives their "<string>" - "<string>" UZS

   Examples:

| merchant_name | branch_name | promotion_number | discount_percentage   | gender       | click_percentage | age_range | click_amount| day|
| Evos          | Tashkent    | 3                | 10%                   | female       | 1%               | 18-45     | 500,000     | Friday |


@tag8

Feature: Cashback Calculation
  @cashback
  Scenario Outline: User receives cashback for purchasing specific products
    Given there is a Merchant with name "<merchant_name>"
    Given there is a branch "<branch_name>" for "<merchant_name>"
    Given there is a "<promotion_number>" promotion with "{10%}" discount only for "<gender>"
    And the click percentage for Merchant "<string>" is "<string>"%
    And the minimum purchase amount for promotion is "1,000,000" UZS
    And the campaign applies to products in the "Electronics" category
    And the age target is 18-55
    When a male user with phone number "998990004444" makes a purchase of "1,200,000" UZS at the "Mirobod" branch
    Then the male user "998990004444" should receive a cashback of 180,000 UZS for products in the "Electronics" category
    Then the male user "998990004444" should not receive a cashback of 180,000 UZS for products in other categories
    Then the user should not receive a cashback if they are older than 55

   Examples:

| merchant_name | branch_name | promotion_number | discount_percentage   | gender       | click_percentage | age_range | click_amount| day|
| Evos          | Tashkent    | 3                | 10%                   | female       | 1%               | 18-45     | 500,000     | Friday |
| KFC           | Yunusabad   | 4                | 15%                   | male         | 1%               | 18-45     | 500,000     | all    |
| MaxWay        |