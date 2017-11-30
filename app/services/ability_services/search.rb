module AbilityServices
  class Search < Base
    def initialize(ability_id = nil)
      @ability_id = ability_id
    end

    def fetch
      return unless @ability_id

      response =
        Rails.cache.fetch(ability_url, expires_in: 20.minutes) do
          HTTParty.get(full_url + @ability_id.to_s).to_json
        end

      process(JSON.parse(response))
    end

    def process(response)
      process_ability_data(response)
    end

    private

    def ability_url
      full_url + @ability_id.to_s
    end
  end
end
