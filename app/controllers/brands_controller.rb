class BrandsController < ApplicationController
  before_action :set_brand, only: [ :edit, :update, :destroy ]

  def index
    @brands = Brand.all
  end

  def new
    @brand = Brand.new
  end

  def create
    @brand = Brand.new(brand_params)
    if @brand.save
      redirect_to parameters_path, notice: "Brand was successfully created."
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @brand.update(brand_params)
      redirect_to parameters_path, notice: "Brand was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @brand.destroy
    redirect_to parameters_path, notice: "Brand was successfully deleted."
  end

  private

  def set_brand
    @brand = Brand.find(params[:id])
  end

  def brand_params
    params.require(:brand).permit(:name)
  end
end
