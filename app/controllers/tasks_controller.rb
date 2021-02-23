class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :get_user
  before_action :get_category

  def index
    if params[:date]
      @tasks = @category.tasks.where('date <= ?', Date.today).where(completed: false)
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
    @task.user = @user

    if past_date_invalid(@task)
      render :new 
    else
      @task.completed = false
      @task.save
      redirect_to user_category_path(@user, @category)
      flash[:success] = "New task: #{@task.name.upcase}"
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
    @task.user = @user

    if @task.update(task_params)
      redirect_to user_category_task_path(@user, @category, @task)
      flash[:warning] = "Task updated: #{@task.name.upcase}"
    else
      render :edit 
    end
  end


  def destroy
    @task = @category.tasks.find(params[:id])
    @task.user = @user

    @task.destroy
    redirect_to user_category_path(@user, @category)
    flash[:danger] = "Task deleted: #{@task.name.upcase}"
  end


  def completed
    @task = @category.tasks.find(params[:id])
    @task.completed = true
    @task.save
    redirect_to user_category_path(@user, @category)
    flash[:success] = "Completed: #{@task.name.upcase}"
  end


  def incomplete
    @task = @category.tasks.find(params[:id])
    @task.completed = false
    @task.save
    redirect_to user_category_path(@user, @category)
    flash[:danger] = "Pending: #{@task.name.upcase}"
  end


  private


  def get_user
    @user = current_user
  end


  def get_category
    @category = Category.find(params[:category_id])
  end


  def task_params
    params.require(:task).permit(:name, :description, :date, :category_id, :user_id)
  end


  def past_date_invalid(params)
    if params.present? && params.date < Date.today
      params.errors.add(:date, " cannot be in the past")
    end
  end
    
end
