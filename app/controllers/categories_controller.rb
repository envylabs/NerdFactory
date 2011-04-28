class CategoriesController < ApplicationController
  
  def show
    @category = Category.find(params[:id])
    @products = @category.products.active.order(:name).paginate(
      :per_page => 12,
      :page     => params[:page]
    )
  end
  
  def new
    @category = Category.new
  end
  
  def create
    @category = Category.new(params[:category])
    if @category.save
      redirect_to category_url(@category)
    else
      render :action => :new, :status => :unprocessable_entity
    end
  end
  
end
