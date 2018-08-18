class Admins::RecipesController < ApplicationController
  before_action :authenticate_admin!
  before_action :find_recipe, only: [:edit, :update, :show, :destroy]
  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      redirect_to admins_recipes_path
    else
      render 'new'
    end
  end

  def show
  end

  def index
    @recipes = Recipe.all
  end

  def edit
  end

  def update
    if @recipe.update
      redirect_to admins_recipes_path
    else
      render 'edit'
    end
  end

  def destroy
    @recipe.destroy
    redirect_to admins_recipes_path
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :description, :type, :sub_category_id)
  end

  def find_recipe
    @recipe = Recipe.find(params[:id])
  end
end
