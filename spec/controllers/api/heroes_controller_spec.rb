require 'rails_helper'


RSpec.describe Api::HeroesController, type: :controller do
  describe 'GET index' do

    before do
      HeroServices::List.new.stubs(:fetch).returns(true)
    end

    it 'renders hero lists'
  end
end
