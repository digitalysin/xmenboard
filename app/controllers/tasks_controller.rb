class TasksController < ApplicationController
  before_action :authenticate_user!

  def new
    @task = current_user.task_owners.build
  end

  def show
    @task = Task.find params[:id]
  end

  def create
    @task = current_user.task_owners.build task_params
    if @task.save
      redirect_to root_path, notice: 'Task successfully created.'
    else
      render :new
    end
  end

  def edit
    @task = Task.find params[:id]
  end

  def update
    @task = Task.find params[:id]
    if @task.update_attributes(task_params)
      redirect_to root_path, notice: 'Task successfully updated.'
    else
      render :edit
    end
  end

  private
  def task_params
    params.require(:task).permit(:name, :description, :finished, :user_id, :owner_id)
  end
end
