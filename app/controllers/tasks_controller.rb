class TasksController < ApplicationController
# 各アクションは非同期化する
before_action :set_task, only:[:update, :destroy]
before_action :set_tasks

  def index
    @task = Task.new
  end

  def create
    task = Task.new(task_params)
    task.save
    respond_to do |format|
      format.js
    end
  end

  def update
    @task.update(task_params)
    respond_to do |format|
      format.js
    end
  end

  def destroy
    @task.destroy
    render nothing: true
  end

  def search_tasks
    @tasks = Task.where('content like ?', "%#{params[:q]}%")
    @compleated = Task.where(compleate: true).where('content like ?', "%#{params[:q]}%")
  end

  private
  def task_params
    params.require(:task).permit(:content, :deadline, :compleate).merge(user_id: current_user.id)
  end

  def set_task
     @task = Task.find(params[:id])
  end

  def set_tasks
    # 暫定処理
    @tasks = current_user.tasks.page(params[:page]).per(15).order(params[:sort])
    @compleated = current_user.tasks.where(compleate: true)
  end

end
