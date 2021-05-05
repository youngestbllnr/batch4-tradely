require 'rails_helper'

RSpec.describe 'Broker', type: :feature do
  describe 'portfolio management' do
    let!(:broker) { create(:user, :broker) }

    it 'displays all stocks that can be added to portfolio' do
      user_login(broker)

      visit broker_dashboard_path

      expect(page).to have_content('Add to Portfolio')
    end

    it 'adds a stock on the market to the portfolio' do
      user_login(broker)

      visit broker_dashboard_path
      click_on('Add to Portfolio', match: :first)

      expect(page).to have_content('has been added to your portfolio')
    end

    it 'removes a stock from the portfolio' do
      user_login(broker)

      visit broker_dashboard_path
      click_on('Add to Portfolio', match: :first)

      visit broker_portfolio_path
      click_on('Remove', match: :first)

      expect(page).to have_content('removed from your portfolio')
    end
  end

  describe 'transaction monitoring' do
    let!(:broker) { create(:user, :broker) }

    it 'displays all stocks that can be added to portfolio' do
      user_login(broker)

      visit broker_transactions_path

      expect(page).to have_content('Transactions')
    end
  end
end
