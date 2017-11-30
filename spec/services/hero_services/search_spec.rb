require 'rails_helper'

RSpec.describe HeroServices::Search, type: :service do
  let(:service) { HeroServices::Search.new(1) }

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
