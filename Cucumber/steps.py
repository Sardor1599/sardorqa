from behave import given, when, then

# Шаги сценария
@given('there is a Merchant with name "{merchant_name}"')
def step_given_merchant(context, merchant_name):
    context.merchant_name = merchant_name

@given('there is a branch "{branch_name}" for "{merchant_name}"')
def step_given_branch(context, branch_name, merchant_name):
    context.branch_name = branch_name
    context.merchant_name = merchant_name

@given('there is a promotion with "{10%}" discount only for females')
def step_given_promotion(context, discount):
    context.discount = discount


And the minimum purchase amount for promotion  is "500,000" UZS


@given('the click percentage for Merchant "{merchant_name}" is "{1}"%')
def step_given_click_percentage(context, merchant_name, click_percentage):
    context.merchant_name = merchant_name
    context.click_percentage = click_percentage

@given('the age target is "{18-45}"')
def step_given_age_target(context, age_range):
    context.age_range = age_range

@when('a user with phone number "{user_phone_number}" makes a transfer of "{transfer_amount}" UZS')
def step_when_user_makes_transfer(context, user_phone_number, transfer_amount):
    context.user_phone_number = user_phone_number
    context.transfer_amount = transfer_amount

@then('the user "{user_phone_number}" should {should not receive cashback, as the click percentage does not apply to males}')
def step_then_user_should_receive_cashback(context, user_phone_number, cashback):
    assert context.user_phone_number == user_phone_number
    assert context.receive_cashback == cashback

# Парсинг таблицы с примерами
@then('the user "{user_phone_number}" should not receive cashback, as the click percentage does not apply to males')
def step_then_user_should_not_receive_cashback(context, user_phone_number):
    assert context.user_phone_number == user_phone_number

@then('the user "{user_phone_number}" should receive {click_percentage} - {cashback_amount} UZS cashback')
def step_then_user_should_receive_cashback_amount(context, user_phone_number, click_percentage, cashback_amount):
    assert context.user_phone_number == user_phone_number
    assert context.click_percentage == click_percentage
    assert context.cashback_amount == cashback_amount