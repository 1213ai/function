class RecipesController < ApplicationController
  
  def new
    @recipe = Recipe.new
    @recipe_ingredients = @recipe.recipe_ingredients.build
    @how_to_makes = @recipe.how_to_makes.build
  end
  
  def show
    @recipe = Recipe.find(params[:id])
    @recipe_ingredients = @recipe.recipe_ingredients.all
    @how_to_makes = @recipe.how_to_makes.all
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
    params.require(:recipe).permit(:title, :catchcopy, :image, 
                                  recipe_ingredients_attributes:[:ing_name, :quantity, :_destroy], 
                                  how_to_makes_attributes:[:explanation, :process_image, :order_no, :_destroy])
  end

end
