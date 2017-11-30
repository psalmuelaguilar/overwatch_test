class Api::HeroesController < ApplicationController
  def index
    response = HeroServices::List.new.fetch

    respond_to do |format|
      format.json { render json: response.to_json }
    end
  end

  def show
    response = HeroServices::Search.new(params[:id]).fetch
    respond_to do |format|
      format.json { render json: response.to_json }
    end
  end

  def abilities
    response = HeroServices::Ability.new(params[:id]).fetch
    respond_to do |format|
      format.json { render json: response.to_json }
    end
  end
end
