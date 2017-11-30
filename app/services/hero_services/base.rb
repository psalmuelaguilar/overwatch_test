module HeroServices
  class Base
    def full_url
      'https://overwatch-api.net/api/v1/hero/'
    end

    private

    def process_hero_data(hero)
      hero_object = {}
      hero_attributes.each do |attribute|
        hero_object[attribute.to_sym] = hero[attribute]
      end
      hero_object
    end

    def hero_attributes
      %w(id name real_name health armour shield)
    end
  end
end
