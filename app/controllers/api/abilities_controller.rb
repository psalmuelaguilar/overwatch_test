class Api::AbilitiesController < ApplicationController
  def index
    response = AbilityServices::List.new.fetch

    respond_to do |format|
      format.json { render json: response.to_json }
    end
  end

  def show
    response = AbilityServices::Search.new(params[:id]).fetch
    respond_to do |format|
      format.json { render json: response.to_json }
    end
  end
end
