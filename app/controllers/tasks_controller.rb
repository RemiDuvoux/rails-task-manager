class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.save
    redirect_to task_path(@task.id)
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
    @task.save
    redirect_to task_path(@task.id)
  end

  def destroy
    @task = Task.find(params[:id])
    @task.delete
    redirect_to tasks_path
  end

  def mark_as_done
    @task = Task.find(params[:id])
    @task.status = "done"
    @task.save
    redirect_to task_path(@task.id)
  end

  def mark_as_undone
    @task = Task.find(params[:id])
    @task.status = "to do"
    @task.save
    redirect_to task_path(@task.id)
  end

  private

   def task_params
    # *Strong params*: You need to *whitelist* what can be updated by the user
    # Never trust user data!
    params.require(:task).permit(:content, :status)
  end
end
