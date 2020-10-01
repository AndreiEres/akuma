# frozen_string_literal: true

class TaskSuggester
  def suggest
    oldest_unassigned_task
  end

  private

  def oldest_unassigned_task
    Task.unassigned.oldest
  end
end
