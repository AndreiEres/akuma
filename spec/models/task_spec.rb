# frozen_string_literal: true

require "rails_helper"

RSpec.describe Task, type: :model do
  describe "validations" do
    it { is_expected.to validate_presence_of :title }
    it { is_expected.to validate_presence_of :issuer }
  end

  describe ".oldest" do
    it "returns oldest task from all" do
      oldest_task = create(:task)
      create_list(:task, 3)

      expect(described_class.oldest).to eq oldest_task
    end

    it "returns oldest task from group" do
      oldest_task = create(:task)
      create_list(:task, 3)

      expect(described_class.unassigned.oldest).to eq oldest_task
    end
  end
end
