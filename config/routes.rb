# frozen_string_literal: true

Rails.application.routes.draw do
  resources :tasks

  get "/task_suggestion", to: "tasks#suggest"
end
