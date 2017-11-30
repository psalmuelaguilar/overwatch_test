require 'rails_helper'

RSpec.describe AbilityServices::List, type: :service do
  let(:service) { AbilityServices::List.new }
  before do
    HTTParty.stubs(:get).returns( { } )
  end
  describe '#fetch' do
    it 'returns a processed response' do
      service.expects(:process)
      service.fetch
    end
  end
end
