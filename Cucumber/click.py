python
from behave import given, when, then, step

@given('there is a Merchant with name "{merchant_name}"')
def step_given_merchant(context, merchant_name):
    # Implement this step

@given('there is a branch "{branch_name}" for "{merchant_name}"')
def step_given_branch(context, branch_name, merchant_name):
    # Implement this step

@given('there is a promotion with "{discount}" discount only for females')
def step_given_promotion(context, discount):
    # Implement this step

@given('the click percentage for Merchant "{merchant_name}" is "{click_percentage}"')
def step_given_click_percentage(context, merchant_name, click_percentage):
    # Implement this step

@given('the age target is "{age_range}"')
def step_given_age_target(context, age_range):
    # Implement this step

@when('a user with phone number "{user_phone_number}" makes a transfer of "{transfer_amount}" UZS')
def step_when_user_makes_transfer(context, user_phone_number, transfer_amount):
    # Implement this step

@then('the user "{user}" should "{cashback}"')
def step_then_user_should_receive_cashback(context, user, cashback):
    # Implement this step

@given('there is a "{branch_name}" branch for "{merchant_name}"')
def step_given_branch_not_participating(context, branch_name, merchant_name):
    # Implement this step

@given('there is a "{promotion_number}" promotion with "{discount_percentage}" discount only for "{gender}"')
def step_given_promotion_not_participating(context, promotion_number, discount_percentage, gender):
    # Implement this step

@when('a "{user}" user aged "{age}" makes a purchase of "{purchase_amount}" UZS at the "{branch_name}" branch')
def step_when_user_makes_purchase(context, user, age, purchase_amount, branch_name):
    # Implement this step

@then('the "{user}" user aged "{age}" should not receive cashback, as the "{branch_name}" branch is not participating in the "{promotion_number}" promotion for "{merchant_name}"')
def step_then_user_should_not_receive_cashback(context, user, age, branch_name, promotion_number, merchant_name):
    # Implement this step

@then('the click receives their "{resulting_url}" - "{page_title}" UZS')
def step_then_click_receives_cashback(context, resulting_url, page_title):
    # Implement this step