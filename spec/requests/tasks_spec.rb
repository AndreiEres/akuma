# frozen_string_literal: true

require "rails_helper"

RSpec.describe "/tasks", type: :request do
  let(:valid_attributes) do
    { title: "Renew contract for Frau Anna",
      issuer: "postman" }
  end

  let(:invalid_attributes) do
    { title: nil,
      context: "It is very important" }
  end

  describe "GET /index" do
    it "renders a successful response" do
      get tasks_url

      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      task = create(:task)

      get task_url(task)

      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "when parameters is valid" do
      it "creates a new Task" do
        expect do
          post tasks_url, params: { task: valid_attributes }
        end.to change(Task, :count).by(1)
      end

      it "renders a JSON response with the new task" do
        post tasks_url, params: { task: valid_attributes }

        expect(response).to have_http_status(:created)
      end
    end

    context "when parameters is NOT valid" do
      it "does not create a new Task" do
        expect do
          post tasks_url, params: { task: invalid_attributes }
        end.to change(Task, :count).by(0)
      end

      it "renders a JSON response with errors for the new task" do
        post tasks_url, params: { task: invalid_attributes }

        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "PATCH /update" do
    context "when parameters is valid" do
      it "renders a JSON response with the task" do
        task = create(:task)

        patch task_url(task), params: { task: valid_attributes }

        expect(response).to have_http_status(:ok)
      end
    end

    context "when parameters is NOT valid" do
      it "renders a JSON response with errors for the task" do
        task = create(:task)

        patch task_url(task), params: { task: invalid_attributes }

        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested task" do
      task = create(:task)

      expect do
        delete task_url(task)
      end.to change(Task, :count).by(-1)
    end
  end
end
