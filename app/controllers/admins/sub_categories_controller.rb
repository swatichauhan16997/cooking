class Admins::SubCategoriesController < ApplicationController
  before_action :authenticate_admin !
  before_action :find_sub_category, only: [:show, :edit, :update, :destroy]

  def new
    @sub_category = SubCategory.new
  end

  def create
    @sub_category = SubCategory.new(sub_category_params)
    @sub_category.category_id =params[:category][:id]
    if @sub_category.save
      redirect_to admins_sub_categories_path
    else
      render 'new'
    end
  end

  def show
  end

  def index
    @sub_categories = SubCategory.all
  end

  def edit
  end

  def update
    @sub_category.category_id =params[:category][:id]
    if @sub_category.update(sub_category_params)
      redirect_to admins_sub_categories_path
    else
      render 'edit'
    end
  end

  def destroy
    @sub_category.destroy
    redirect_to admins_sub_categories_path  
  end

  private

  def sub_category_params
    params.require(:sub_category).permit(:name, :category_id)
  end

  def find_sub_category
    @sub_category = SubCategory.find(params[:id])
  end
end
