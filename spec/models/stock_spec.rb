require 'rails_helper'

RSpec.describe Stock, type: :model, vcr: true do
  describe 'list' do
    it 'returns the top 10 active stocks from IEX Ruby Client' do
      expect(described_class.list).to be_an_instance_of(Array)
    end
  end
end