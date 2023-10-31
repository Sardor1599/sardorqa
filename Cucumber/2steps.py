python
# Импорт необходимых модулей
from behave import given, when, then

# Шаги сценария
@given('there is a Merchant with name "{Evos}"')
def step_given_merchant(context, merchant_name):
    context.merchant_name = merchant_name

@given('there is a branch "{Chilonzor}" for "{Evos}"')
def step_given_branch(context, branch_name, merchant_name):
    context.branch_name = branch_name
    context.merchant_name = merchant_name

@given('there is a "{3promotion}" promotion with "{10%}" discount only for "{female}"')
def step_given_promotion(context, promotion_number, discount_percentage, gender):
    context.promotion_number = promotion_number
    context.discount_percentage = discount_percentage
    context.gender = gender

@given('the click percentage for Merchant "{Evos}" is "{1}"')
def step_given_click_percentage(context, merchant_name, click_percentage):
    context.merchant_name = merchant_name
    context.click_percentage = click_percentage

@given('the age target is "{18-45}"')
def step_given_age_target(context, age_range):
    context.age_range = age_range

@when('a "{user_gender}" user aged "{user_age}" makes a purchase of "{purchase_amount}" UZS at the "{branch_name}" branch')
def step_when_user_makes_purchase(context, user_gender, user_age, purchase_amount, branch_name):
    context.user_gender = user_gender
    context.user_age = user_age
    context.purchase_amount = purchase_amount
    context.branch_name = branch_name

@then('the "{user_gender}" user aged "{user_age}" should not receive cashback, as the "{branch_name}" branch is not participating in the "{promotion_number}" promotion for "{merchant_name}"')
def step_then_user_should_not_receive_cashback(context, user_gender, user_age, branch_name, promotion_number, merchant_name):
    assert context.user_gender == user_gender
    assert context.user_age == user_age
    assert context.branch_name == branch_name
    assert context.promotion_number == promotion_number
    assert context.merchant_name == merchant_name

@then('the click receives their "{click_amount}" - "{purchase_amount}" UZS')
def step_then_click_receives_amount(context, click_amount, purchase_amount):
    assert context.click_percentage == click_amount
    assert context.purchase_amount == purchase_amount