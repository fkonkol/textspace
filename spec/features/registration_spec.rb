require 'rails_helper'

RSpec.feature 'registration', type: :feature do
  scenario 'user registers successfully' do 
    visit new_registration_path

    fill_in 'Email', with: 'user@example.com'
    fill_in 'Password', with: 'password'
    fill_in 'Confirm password', with: 'password'

    click_button 'Sign up'

    expect(page).to have_content('You have been registered successfully')
  end

  scenario 'user mismatches passwords' do
    visit new_registration_path

    fill_in 'Email', with: 'user@example.com'
    fill_in 'Password', with: 'password'
    fill_in 'Confirm password', with: 'wrong_password'

    click_button 'Sign up'

    expect(page).to have_content("Password confirmation doesn't match Password")
  end

  scenario 'user tries to register with existing email' do
    create(:user, email: 'user@example.com')

    visit new_registration_path

    fill_in 'Email', with: 'user@example.com'
    fill_in 'Password', with: 'password'
    fill_in 'Confirm password', with: 'password'

    click_button 'Sign up'
    
    expect(page).to have_content('Email has already been taken')
  end
end
