module HeroServices
  class List < Base
    def fetch
      response =
        Rails.cache.fetch(full_url, expires_in: 20.minutes) do
          HTTParty.get(full_url).to_json
        end

      process(JSON.parse(response))
    end

    def process(response)
      return unless response.present?
      heroes = []
      response["data"].each do |ability|
        heroes << process_hero_data(ability)
      end
      heroes
    end
  end
end
