class SubcategoriesController < ApplicationController
  before_action :set_subcategory, only: [ :edit, :update, :destroy ]
  before_action :set_categories, only: [ :new, :edit ]

  def index
    @subcategories = Subcategory.all
  end

  def new
    @subcategory = Subcategory.new
  end

  def create
    @subcategory = Subcategory.new(subcategory_params)
    if @subcategory.save
      redirect_to subcategories_path, notice: "Subcategory was successfully created."
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @subcategory.update(subcategory_params)
      redirect_to subcategories_path, notice: "Subcategory was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @subcategory.destroy
    redirect_to subcategories_path, notice: "Subcategory was successfully deleted."
  end

  private

  def set_subcategory
    @subcategory = Subcategory.find(params[:id])
  end

  def set_categories
    @categories = Category.all
  end

  def subcategory_params
    params.require(:subcategory).permit(:name, :category_id)
  end
end
