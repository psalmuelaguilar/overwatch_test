module AbilityServices
  class Base
    def full_url
      'https://overwatch-api.net/api/v1/ability/'
    end

    private

    def ability_attributes
      %w(id name description is_ultimate)
    end

    def process_ability_data(ability)
      ability_object = {}
      ability_attributes.each do |attribute|
        ability_object[attribute.to_sym] = ability[attribute]
      end
      ability_object
    end
  end
end
