class TasksController < ApplicationController
# 各アクションは非同期化する
before_action :set_task, only:[:update, :destroy]
before_action :set_tasks

  def index
    # 暫定対処
    @task = Task.new
  end

  def create
    task = Task.new(task_params)
    task.save
    respond_to do |format|
      format.js
    end
    # redirect_to tasks_path
  end

  def update
    @task.update(task_params)
    respond_to do |format|
      format.js
    end
  end

  def destroy
    @task.destroy
    respond_to do |format|
      format.js
    end
  end

  private
  def task_params
    params.require(:task).permit(:content, :deadline, :compleate)
  end

  def set_task
     @task = Task.find(params[:id])
  end

  def set_tasks
    @tasks = Task.all.order(params[:sort])
  end

end
