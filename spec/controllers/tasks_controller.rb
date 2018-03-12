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

  describe "order_by_created_at_desc" do
    context "日付が新しい順に並ぶかどうか" do
      before(:each) do
        create(:task, id: 1, content: "tast 1", created_at: Time.current)
        create(:task, id: 2, content: "task 2", created_at: Time.current - 1.days)
      end

      example "taskをcreated_atの降順で並び替える" do
        expect(Task.all.order(created_at: :desc).map(&:id)).to eq [1, 2]
      end
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

  describe 'delete #destroy' do
    it "deletes the task" do
      task = create(:task)
      expect { task.destroy }.to change(Task, :count).by(-1)
    end
  end
end
