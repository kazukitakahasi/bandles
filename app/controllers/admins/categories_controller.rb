class Admins::CategoriesController < ApplicationController
  before_action :authenticate_admin!

  def new
  	@category = Category.new
  end

  def create
  	@category = Category.new(category_params)
    if @category.save
      flash[:success] = 'category was successfully created.'
      redirect_to admins_users_path
    else
      redirect_to admins_users_path
    end
  end

  def edit
  end

  private
    def category_params
   	  params.require(:category).permit(:name)
    end
end
