class Admins::CategoriesController < ApplicationController
  before_action :authenticate_admin!
  before_action :find_company, only: [:show, :edit, :destroy, :update]
  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to admins_categories_path
    else
      render 'new'
    end 
  end

  def show
  end

  def index
    @categories = Category.all
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    if @category.update(category_params)
      redirect_to admins_categories_path
    else
      render 'edit'
    end
  end

  def destroy
    @category.destroy
    redirect_to admins_categories_path
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

  def find_company
    @category = Category.find(params[:id])
  end

end
