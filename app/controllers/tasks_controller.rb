class TasksController < ApplicationController
  before_action :get_category
  def index
    @tasks = @category.tasks
  end

  def new
    @task = @category.tasks.build
  end

  def create
    @task = @category.tasks.build(task_params)

    if @task.save
      redirect_to category_path(@category)
      flash[:success] = "Task created!"
    else
      render :new
    end
  end

  def show
    @task = @category.tasks.find(params[:id])
  end

  def edit
    @task = @category.tasks.find(params[:id])
  end

  def update
    @task = @category.tasks.find(params[:id])

    if @task.update(task_params)
      redirect_to category_task_path(@category, @task)
      flash[:warning] = "Task updated!"
    else
      render :edit
    end
  end

  def destroy
    @task = @category.tasks.find(params[:id])
    @task.destroy
    redirect_to category_path(@category)
    flash[:danger] = "Task deleted!"
  end

  private

  def get_category
    @category = Category.find(params[:category_id])
  end

  def task_params
    params.require(:task).permit(:name, :description, :date, :category_id)
  end
end
