class TasksController < ApplicationController
# フラッシュメッセージは削除予定
# 各アクションは非同期化する
before_action :set_task, only:[:update, :destroy]

  def index
    # 暫定対処
    @task = Task.new
    @tasks = Task.all.order(created_at: :desc)
  end

  def create
    task = Task.new(task_params)
    if task.save
      redirect_to tasks_path, notice: 'タスクが作成されました'
    else
      redirect_to tasks_path, alert: 'タスクを入力してください'
    end
  end

  def update
    @task.update(task_params)
    redirect_to tasks_path, notice: 'タスクが編集されました'
  end

  def destroy
    @task.destroy
    redirect_to tasks_path, notice: 'タスクが削除されました'
  end

  private
  def task_params
    params.require(:task).permit(:content)
  end

  def set_task
     @task = Task.find(params[:id])
  end

end
