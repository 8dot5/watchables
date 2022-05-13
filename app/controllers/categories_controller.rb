class CategoriesController < ApplicationController
  before_action :find_category, only: [:show, :update, :destroy]

  # GET /categories | show all categories
  def index
    render json: Category.all, status: :ok
  end

  # GET /categories/# | get a watchable
  def show
    render json: find_category, status: :ok
  end

  # POST /categories | create a category
  def create
    # new_category = Category.new(category_params)

    if new_category.save
      render json: new_category, status: :created, location: new_category
    else
      render json: new_category.errors, status: :unprocessable_entity
    end
  end

  # PATCH /categories/# | update a category
  def update
    if find_category.update(category_params)
      render json: find_category, status: :ok
    else
      render json: find_category.errors, status: :unprocessable_entity
    end
  end

  # DELETE /categories/# | delete a category
  def destroy
    find_category.destroy!
    render json: {}, status: :gone
  end

  private

  def find_category
    Category.find(params[:id])
  end

  def new_category
    Category.new(category_params)
  end

  def category_params
    params.permit(:name)
  end
end
