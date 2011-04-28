class ProductsController < ApplicationController

  respond_to :html, :xml, :json
  
  def index
    @products = Product.where(:active => true).order(:name).paginate(
      :per_page => 12,
      :page     => params[:page]
    )

    respond_with @products
  end
  
  def show
    @product = Product.find(params[:id])

    respond_with @product
  end
  
  def new
    @category = Category.find(params[:category_id])
    @product  = @category.products.build
  end
  
  def create
    @category = Category.find(params[:category_id])
    @product  = @category.products.build(params[:product])
    if @product.save
      redirect_to(product_url(@product))
    else
      render :action => :new, :status => :unprocessable_entity
    end
  end
  
end
