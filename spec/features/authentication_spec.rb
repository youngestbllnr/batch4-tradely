require 'rails_helper'

RSpec.describe 'Authentication', type: :feature do
  describe 'registration' do
    it 'redirects to user index when inputs are valid' do
      visit new_user_registration_path
      fill_in('First Name', with: 'Carl Angel')
      fill_in('Last Name', with: 'Rosales')
      fill_in('Email Address', with: 'test@tradely.com')
      fill_in('Password', with: 'password')
      fill_in('Confirm Password', with: 'password')
      click_on('Sign Up')

      expect(page).to have_content('A message with a confirmation link has been sent to your email address. Please follow the link to activate your account.')
    end
  end

  describe 'login' do
    before do
      user = create(:user)
      user.confirm
    end

    it 'redirects to user index when inputs are valid' do
      visit new_user_session_path
      fill_in('Email Address', with: 'test@tradely.com')
      fill_in('Password', with: 'password')
      click_on('Log In')

      expect(page).to have_current_path(buyer_dashboard_path)
    end

    it 'renders the sign up form when email address is NOT valid' do
      visit new_user_session_path
      fill_in('Email Address', with: 'invalid@tradely.com')
      fill_in('Password', with: 'password')
      click_on('Log In')

      expect(page).to have_content('Invalid')
    end

    it 'renders the sign up form when password is NOT valid' do
      visit new_user_session_path
      fill_in('Email Address', with: 'carl@tradely.com')
      fill_in('Password', with: 'wrong password')
      click_on('Log In')

      expect(page).to have_content('Invalid')
    end
  end
end
