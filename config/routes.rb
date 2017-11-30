OverwatchTest::Application.routes.draw do
  namespace :api do
    resources :heroes, defaults: {format: :json} do
      member do
        get :abilities
      end
    end

    resources :abilities
  end
end
