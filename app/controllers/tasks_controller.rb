class TasksController < ApplicationController
  before_action :get_category

  def index
    if params[:date]
      @tasks = @category.tasks.where(date: Date.today)
      render template: 'tasks/show_due.html.erb'
    else
      @tasks = @category.tasks
    end
  end

  def new
    @task = @category.tasks.build
  end

  def create
    @task = @category.tasks.build(task_params)

    if @task.save
      @task.completed = false
      @task.save
      redirect_to category_path(@category)
      flash[:success] = "New task: #{@task.name.upcase}"
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
      flash[:warning] = "Task updated: #{@task.name.upcase}"
    else
      render :edit
    end
  end

  def destroy
    @task = @category.tasks.find(params[:id])
    @task.destroy
    redirect_to category_path(@category)
    flash[:danger] = "Task deleted: #{@task.name.upcase}"
  end

 def completed
   @task = @category.tasks.find(params[:id])
   @task.completed = true
   @task.save
   redirect_to category_path(@category)
   flash[:success] = "Completed: #{@task.name.upcase}"
 end

 def incomplete
   @task = @category.tasks.find(params[:id])
   @task.completed = false
   @task.save
   redirect_to category_path(@category)
   flash[:danger] = "Pending: #{@task.name.upcase}"
 end

  private

  def get_category
    @category = Category.find(params[:category_id])
  end

  def task_params
    params.require(:task).permit(:name, :description, :date, :category_id)
  end
end
