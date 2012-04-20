class ProductsController < ApplicationController
  skip_authorization_check
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(params[:product])
    if @product.save
      redirect_to @product, :notice => "Successfully created product."
    else
      render :action => 'new'
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update_attributes(params[:product])
      redirect_to @product, :notice  => "Successfully updated product."
    else
      render :action => 'edit'
    end
  end
  
  def find_unit_price
    @product = Product.find(params[:id])
    unit_price = @product.unit_price 
    @msg = { "success" => "true", "unit_price" => unit_price}
    respond_to do |format|
      format.html
      format.json { render :json => @msg }
    end
 end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to products_url, :notice => "Successfully destroyed product."
  end
end
