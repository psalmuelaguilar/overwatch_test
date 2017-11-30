module HeroServices
  class Search < Base
    def initialize(hero_id = nil)
      @hero_id = hero_id
    end

    def fetch
      return unless @hero_id

      response =
        Rails.cache.fetch(hero_url, expires_in: 20.minutes) do
          HTTParty.get(full_url + @hero_id.to_s).to_json
        end

      process(JSON.parse(response))
    end

    def process(response)
      process_hero_data(response)
    end

    private

    def hero_url
      full_url + @hero_id.to_s
    end
  end
end
