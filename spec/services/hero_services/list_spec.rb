require 'rails_helper'

RSpec.describe HeroServices::List, type: :service do
  let(:service) { HeroServices::List.new }

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
