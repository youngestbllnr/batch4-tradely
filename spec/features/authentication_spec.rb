require 'rails_helper'

RSpec.describe 'Authentication', type: :feature do
	describe 'registration' do
		it 'redirects to user index when email address and password are valid' do
			visit new_user_registration_path
			fill_in('First Name', with: 'Carl Angel')
			fill_in('Last Name', with: 'Rosales')
			fill_in('Email Address', with: 'test@tradely.com')
			fill_in('Password', with: 'password')
			fill_in('Confirm Password', with: 'password')
			click_on('Sign Up')

			expect(page).to have_no_content("can't be blank")
			expect(page).to have_content('A message with a confirmation link has been sent to your email address. Please follow the link to activate your account.')
			expect(page).to have_current_path(root_path)
		end
	end

	describe 'login' do
		let!(:user) { create(:user) }
		
		it 'redirects to user index when email address and password are valid' do
			visit new_user_session_path
			fill_in('Email Address', with: 'test@tradely.com')
			fill_in('Password', with: 'password')
			click_on('Log In')

			expect(page).to have_no_content('Invalid')
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
