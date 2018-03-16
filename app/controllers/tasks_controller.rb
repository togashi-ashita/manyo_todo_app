class TasksController < ApplicationController
# 各アクションは非同期化する
before_action :set_task, only:[:update, :destroy]

  def index
    # 暫定対処
    @task = Task.new
    @tasks = Task.all.order(params[:sort])
  end

  def create
    task = Task.new(task_params)
    task.save
    redirect_to tasks_path
  end

  def update
    @task.update(task_params)
    redirect_to tasks_path
  end

  def destroy
    @task.destroy
    redirect_to tasks_path
  end

  private
  def task_params
    params.require(:task).permit(:content, :deadline)
  end

  def set_task
     @task = Task.find(params[:id])
  end

end
