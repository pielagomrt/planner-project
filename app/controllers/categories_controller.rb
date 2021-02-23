class CategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :get_user

  def index
    @categories = @user.categories
  end


  def new
    @category = @user.categories.build
  end


  def create
    @category = @user.categories.build(categories_params)

    if @category.save
      redirect_to user_categories_path(@user)
      flash[:success] = "Category created: #{@category.name.upcase}"
    else
      render :new
    end
  end


  def show
    @category = @user.categories.find(params[:id])
    @tasks = @category.tasks
  end


  def edit
    @category = @user.categories.find(params[:id])
  end


  def update
    @category = @user.categories.find(params[:id])

    if @category.update(categories_params)
      redirect_to user_category_path(@user, @category)
      flash[:warning] = "Category updated: #{@category.name.upcase}"
    else
      render :edit
    end
  end


  def destroy
    @category = @user.categories.find(params[:id])
    @category.destroy
    redirect_to user_categories_path(@user)
    flash[:danger] = "Category deleted: #{@category.name.upcase}"
  end


  private


  def get_user
    @user = current_user
  end

  
  def categories_params
    params.require(:category).permit(:name, :user_id)
  end

end
