require 'rails_helper'

RSpec.describe HeroServices::Ability, type: :service do
  let(:service) { HeroServices::Ability.new(1) }

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
