module AbilityServices
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
      abilities = []
      response["data"].each do |ability|
        abilities << process_ability_data(ability)
      end
      abilities
    end
  end
end
