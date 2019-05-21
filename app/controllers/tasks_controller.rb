class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @id = params[:id].to_i
    selection = Task.select do |task|
      task.id == @id
    end
    @task = selection[0]
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.save
  end

  def update
    @id = params[:id].to_i
    selection = Task.select do |task|
      task.id == @id
    end
    @task = selection[0]
    @task.update(task_params)
  end

  def edit
    @id = params[:id].to_i
    selection = Task.select do |task|
      task.id == @id
    end
    @task = selection[0]
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path
  end

  private

  def task_params
    # *Strong params*: You need to *whitelist* what can be updated by the user
    # Never trust user data!
    params.require(:task).permit(:title, :details, :completed)
  end
end
