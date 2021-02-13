class CategoriesController < ApplicationController

  def index
    @categories = Category.all
  end


  def new
    @category = Category.new
  end


  def create
    @category = Category.new(categories_params)

    if @category.save
      redirect_to categories_path
      flash[:success] = "Successfully created a category"
    else
      render :new
    end
  end


  def show
    @category = Category.find(params[:id])
    @tasks = @category.tasks
  end


  def edit
    @category = Category.find(params[:id])
  end


  def update
    @category = Category.find(params[:id])

    if @category.update(categories_params)
      redirect_to category_path(@category)
      flash[:warning] = "Successfully updated a category!"
    else
      render :edit
    end
  end


  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to categories_path
    flash[:danger] = "Successfully deleted a category"
  end


  private


  def categories_params
    params.require(:category).permit(:name)
  end

end
