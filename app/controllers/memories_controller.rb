class MemoriesController < ApplicationController
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
    @memory = Memory.find(params[:id])
    authorize @memory
  end

  def edit
    @memory = Memory.find(params[:id])
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
    @memory = Memory.find(params[:id])
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
    @memory = Memory.find(params[:id])
    @memory.destroy
    authorize @memory
  end

  private

    def memory_params
      params.require(:memory).permit(:user_id, :name, :description)
    end
end
