# frozen_string_literal: true

Rails.application.routes.draw do
  resources :customers, only: %i[index show create] do
    resources :orders, only: %i[index show]
  end

  resources :orders, only: %i[create]
end
