class CategoriesController < ApplicationController

  def index
    @categories = Category.all
  end

  def show
    @category = Category.find_by_category(params[:id]) ##sloppy - need to fix properly, works for now
    # @category = Category.find_by_category("w4m")
  end

  private
  def category_params
    params.require(:category).permit(:category)
  end
end
