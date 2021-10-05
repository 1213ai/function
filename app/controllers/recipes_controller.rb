class RecipesController < ApplicationController
  
  def new
    @recipe = Recipe.new
  end
  
  def show
    @recipe = Recipe.find(params[:id])
  end

  def index
    @recipes = Recipe.all
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user_id = current_user.id
    if @recipe.save
      redirect_to recipe_path(@recipe), notice: "You have created recipe successfully."
    else
      @recipes = Recipe.all
      render 'index'
    end
  end

  def destroy
    @recipe.destroy
    redirect_to recipes_path
  end

  private

  def recipe_params
    params.require(:recipe).permit(:title, :catchcopy, :image)
  end


end
