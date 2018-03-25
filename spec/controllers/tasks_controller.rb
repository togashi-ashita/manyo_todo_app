require 'rails_helper'

describe TasksController do
  describe 'GET #index' do
    it "assigns the requested contact to tasks" do
      tasks = create_list(:task, 3)
      get :index
      expect(assigns(:tasks)).to eq tasks
    end
    it "renders the :index template" do
      get :index
      expect(response).to render_template :index
    end
  end

  describe 'POST #create' do
    it "success to save" do
      task = build(:task)
      expect { task.save }.to change(Task, :count).by(1)
    end
  end

  describe 'PATCH #update' do
    it "changes task's attributes" do
      task = create(:task)
      task.update(content: "hoge")
      task.reload
      expect(task.content).to eq("hoge")
    end
  end

  describe 'DELETE #destroy' do
    it "deletes the task" do
      task = create(:task)
      expect { task.destroy }.to change(Task, :count).by(-1)
    end
  end
end
