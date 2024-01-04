require 'rails_helper'

RSpec.feature 'login', type: :feature do
  let(:user) { create(:user) }

  scenario 'user logs in successfully' do
    visit new_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Sign in'

    expect(page).to have_content('You have been logged in successfully!')
  end

  scenario 'user login fails with invalid email' do 
    visit new_session_path

    fill_in 'Email', with: 'invalid_email'
    fill_in 'Password', with: user.password

    click_button 'Sign in'

    expect(page).to have_content('Invalid email or password')
  end

  scenario 'user login fails with invalid password' do
    visit new_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: 'wrong_password'

    click_button 'Sign in'

    expect(page).to have_content('Invalid email or password')
  end
end
