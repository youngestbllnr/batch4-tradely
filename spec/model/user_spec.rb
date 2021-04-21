
require 'rails_helper'

RSpec.describe User, type: :model do
    it { expect(described_class.new).to validate_presence_of :firstname }
    it { expect(described_class.new).to validate_presence_of :lastname } 
end