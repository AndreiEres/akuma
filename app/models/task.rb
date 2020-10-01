# frozen_string_literal: true

class Task < ApplicationRecord
  validates :title, :issuer, presence: true

  enum status: { unassigned: 0,
                 assigned: 1 }

  def self.oldest
    order(:created_at).limit(1).first
  end
end
