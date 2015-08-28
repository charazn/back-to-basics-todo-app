class ListsController < ApplicationController

  before_action :set_list, only: [:show, :edit, :update, :archive]

  def index
    @lists = List.all
  end

  def show
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to @list, flash: { success: "List successfully created" }
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @list.update(list_params)
      redirect_to @list, flash: { success: "List successfully updated" }
    else 
      render :edit
    end
  end

  def archive

  end

  private

    def set_list
      @list = List.find(params[:id])
    end

    def list_params
      params.require(:list).permit(:title, :description)
    end

end
