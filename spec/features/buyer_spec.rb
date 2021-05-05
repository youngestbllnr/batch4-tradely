require 'rails_helper'

RSpec.describe 'Buyer', type: :feature do
  describe 'portfolio management' do
    let!(:buyer) { create(:user, :buyer) }
    let!(:broker) { create(:user, :broker) }

    it 'displays all stocks that can be bought' do
      add_broker_stocks(broker)
      user_login(buyer)

      visit buyer_dashboard_path

      expect(page).to have_content('Buy Stocks')
    end

    it 'buys and adds a stock to the portfolio' do
      add_broker_stocks(broker)
      user_login(buyer)

      visit buyer_dashboard_path
      click_on('Buy Stocks', match: :first)

      fill_in('Units', with: 12)
      click_on('Buy')

      expect(page).to have_content('Transaction was successful.')
    end

    it 'removes a stock from the portfolio' do
      add_broker_stocks(broker)
      user_login(buyer)

      visit buyer_dashboard_path
      click_on('Buy Stocks', match: :first)

      fill_in('Units', with: 12)
      click_on('Buy')

      visit buyer_portfolio_path
      click_on('Sell Stocks', match: :first)

      expect(page).to have_content('removed from your portfolio')
    end
  end

  describe 'transaction monitoring' do
    let!(:buyer) { create(:user, :buyer) }
    
    it 'displays all stocks that can be added to portfolio' do
      user_login(buyer)

      visit buyer_transactions_path

      expect(page).to have_content('Transactions')
    end
  end
end
