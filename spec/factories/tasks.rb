# frozen_string_literal: true

FactoryBot.define do
  factory :task do
    sequence(:title) { |n| "Title #{n}" }
    sequence(:issuer) { |n| "Issuer #{n}" }
  end
end
