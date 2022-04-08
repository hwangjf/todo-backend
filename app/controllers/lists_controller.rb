class ListsController < ApplicationController
  before_action :set_list, only: [:show, :update, :destroy]

  # GET /lists
  def index
    @user = User.find(user_params[:user_id])
    @lists = @user.lists

    render json: @lists
  end

  # GET /lists/1
  def show
    render json: @list
  end

  # POST /lists
  def create
    @user = User.find(list_params[:user_id])
    @list = List.new(title: list_params[:title], description: list_params[:description])
    
    if @list.save
      @user.lists << @list
      render json: @list.to_json, status: :created, location: @list
    else
      render json: @list.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /lists/1
  def update
    if @list.update(list_params)
      render json: @list.to_json
    else
      render json: @list.errors, status: :unprocessable_entity
    end
  end

  # DELETE /lists/1
  def destroy
    @list.destroy
  end

  private

  def set_list
    @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:title, :description, :user_id)
  end

  def user_params
    params.permit(:user_id)
  end
end
