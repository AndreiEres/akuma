# frozen_string_literal: true

require "rails_helper"

describe TaskSuggester do
  describe "#suggest" do
    it "suggests oldest task" do
      oldest_task = create(:task)
      create_list(:task, 3)

      expect(described_class.new.suggest).to eq oldest_task
    end

    it "suggests unassigned task" do
      create(:task, status: :assigned)
      unassigned_task = create(:task)

      expect(described_class.new.suggest).to eq unassigned_task
    end
  end
end
