module HeroServices
  class Ability < Base
    def initialize(hero_id = nil)
      @hero_id = hero_id
    end

    def fetch
      return unless @hero_id
      response =
        Rails.cache.fetch(ability_url, expires_in: 20.minutes) do
          HTTParty.get(ability_url).to_json
        end
      process(JSON.parse(response))
    end

    def process(response)
      response['abilities']
    end

    private

    def ability_url
      full_url + @hero_id.to_s
    end
  end
end
