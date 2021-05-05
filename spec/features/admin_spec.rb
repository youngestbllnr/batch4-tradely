require 'rails_helper'

RSpec.describe 'Administrator', type: :feature do
  describe 'creating a buyer' do
    let!(:admin) { create(:user, :admin) }

    it 'redirects to buyers index when all fields are valid' do
      user_login(admin)

      visit new_buyer_path
      fill_in('First Name', with: 'Carl Angel')
      fill_in('Last Name', with: 'Rosales')
      fill_in('Email Address', with: 'buyer@tradely.com')
      fill_in('Password', with: 'password')
      fill_in('Confirm Password', with: 'password')
      click_on('Submit')

      expect(page).to have_current_path(buyers_path)
    end

    it 'renders :new when email is taken or invalid' do
      user_login(admin)

      visit new_buyer_path
      fill_in('First Name', with: 'Carl Angel')
      fill_in('Last Name', with: 'Rosales')
      fill_in('Email Address', with: 'test@tradely.com')
      fill_in('Password', with: 'password')
      fill_in('Confirm Password', with: 'password')
      click_on('Submit')

      expect(page).to have_content('Email has already been taken')
    end

    it 'redirects to buyers index when passwords do not match' do
      user_login(admin)

      visit new_buyer_path
      fill_in('First Name', with: 'Carl Angel')
      fill_in('Last Name', with: 'Rosales')
      fill_in('Email Address', with: 'buyer@tradely.com')
      fill_in('Password', with: 'password')
      fill_in('Confirm Password', with: 'invalidpassword')
      click_on('Submit')

      expect(page).to have_content("Password confirmation doesn't match Password")
    end
  end

  describe 'editing a buyer' do
    let!(:admin) { create(:user, :admin) }
    let!(:buyer) { create(:user, :buyer) }

    it 'redirects to buyers index when all fields are valid' do
      user_login(admin)

      visit edit_buyer_path(buyer)
      fill_in('First Name', with: 'Carl Angel')
      fill_in('Last Name', with: 'Rosales')
      fill_in('Email Address', with: 'updated_buyer@tradely.com')
      fill_in('Password', with: 'password')
      fill_in('Confirm Password', with: 'password')
      click_on('Submit')

      expect(page).to have_current_path(buyers_path)
    end

    it 'renders :new when email is taken or invalid' do
      user_login(admin)

      visit edit_buyer_path(buyer)
      fill_in('First Name', with: 'Carl Angel')
      fill_in('Last Name', with: 'Rosales')
      fill_in('Email Address', with: 'test@tradely.com')
      fill_in('Password', with: 'password')
      fill_in('Confirm Password', with: 'password')
      click_on('Submit')

      expect(page).to have_content('already been taken')
    end

    it 'redirects to buyers index when passwords do not match' do
      user_login(admin)

      visit edit_buyer_path(buyer)
      fill_in('First Name', with: 'Carl Angel')
      fill_in('Last Name', with: 'Rosales')
      fill_in('Email Address', with: 'updated_buyer@tradely.com')
      fill_in('Password', with: 'password')
      fill_in('Confirm Password', with: 'invalidpassword')
      click_on('Submit')

      expect(page).to have_content("doesn't match")
    end
  end

  describe 'deleting a buyer' do
    let!(:admin) { create(:user, :admin) }

    before { create(:user, :buyer) }

    it 'redirects to buyers index after deletion' do
      user_login(admin)

      visit buyers_path
      click_on('Delete')

      expect(page).to have_content('deleted')
    end
  end

  describe 'viewing a buyer' do
    let!(:admin) { create(:user, :admin) }
    let!(:buyer) { create(:user, :buyer) }

    it 'displays all information about the buyer' do
      user_login(admin)

      visit buyer_path(buyer)

      expect(page).to have_content('buyer@tradely.com')
    end
  end

  describe 'broker management' do
    let!(:admin) { create(:user, :admin) }

    before do
      create(:user, :broker)
      create(:user, :pending_broker)
    end

    it 'displays verified brokers' do
      user_login(admin)

      visit brokers_path

      expect(page).to have_content('broker@tradely.com')
    end

    it 'displays pending brokers' do
      user_login(admin)

      visit pending_brokers_path

      expect(page).to have_content('pending_broker@tradely.com')
    end

    it 'approves a pending broker' do
      user_login(admin)

      visit pending_brokers_path
      click_on('Approve')

      visit brokers_path

      expect(page).to have_content('pending_broker@tradely.com')
    end
  end
end
