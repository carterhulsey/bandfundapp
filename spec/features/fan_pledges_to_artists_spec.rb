require 'rails_helper'

TEST_CREDIT_CARD = {number: 4242424242424242, cvc: 123, exp_month:"09", exp_year:2.years.from_now.year, zip:32256}

feature "Fan pledges to artists", :type => :feature, js: true do
  background do
    @reward = create(:reward)
    @fan = create(:fan)
    login_as @fan, scope: :fan
    visit new_reward_pledge_path(@reward)
    fill_in 'First Name', with: "Corey"
    fill_in 'Last Name', with: "Grusden"
    fill_in 'Credit Card Number', with: TEST_CREDIT_CARD[:number]
    fill_in 'Month', with: TEST_CREDIT_CARD[:exp_month]
    fill_in 'Year', with: TEST_CREDIT_CARD[:exp_year]
    fill_in 'Security Code', with: TEST_CREDIT_CARD[:cvc]
    fill_in 'Billing ZIP', with: TEST_CREDIT_CARD[:zip]
  end

  scenario "Stripe API authenication error" do
    click_button "Submit" 
    expect(page).to have_content("Something was wrong with your card")
  end

end
