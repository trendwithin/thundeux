class MemoriesController < ApplicationController
  before_action :set_memory, only: [:show, :edit, :update, :destroy]
  after_action :verify_authorized, unless: :devise_controller?

  def index
    @memories = Memory.all
    authorize @memories
  end

  def new
    @memory = current_user.memories.build
    authorize @memory
  end

  def show
    authorize @memory
  end

  def edit
    authorize @memory
  end

  def create
    @memory = current_user.memories.build(memory_params)
    authorize @memory
    respond_to do |format|
      if @memory.save
        format.html { redirect_to @memory, notice: "Memory was successfully created."}
      else
        format.html { render :new }
      end
    end
  end

  def update
    authorize @memory
    respond_to do |format|
      if @memory.update(memory_params)
        format.html { redirect_to @memory, notice: "Memory was successfully updated." }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    authorize @memory
    @memory.destroy
  end

  private

  def set_memory
    @memory = Memory.find(params[:id])
  end

    def memory_params
      params.require(:memory).permit(:name, :description, :tag_list)
    end
end
