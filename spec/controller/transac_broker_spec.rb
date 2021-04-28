require 'rails_helper'
RSpec.describe "Broker" do
  it "#add_stocks" do
     stock = create(:stock)
  end

end

RSpec.describe "PUT update/:id" do
  let(:stock) do 
    { :on_sale => 'true'}
  end

  before(:each) do
    puts :update, :id => stock
  end
  it "sell_it" do
    stock = Stock.update(:on_sale)
  end
end