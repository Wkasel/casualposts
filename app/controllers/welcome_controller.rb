class WelcomeController < ApplicationController
  # before_action :filter_routes
  # include RouteFilter
  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
  end

  def subcategory
    # @subcategories = Category.find_by_shortname(session[:category])
  end

  private
  def category_params
    params.require(:category).permit(:category)
  end



end
