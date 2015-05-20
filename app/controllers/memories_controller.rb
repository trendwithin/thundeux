class MemoriesController < ApplicationController

  def index
    @memories = Memory.all
  end

  def new
    @memory = Memory.new
  end

  def show
    @memory = Memory.find(params[:id])
  end

  def create
    @memory = Memory.new(memory_params)
    respond_to do |format|
      if @memory.save
        format.html { redirect_to @memory, notice: "Memory was succesfully created."}
      else
        format.html { render :new }
      end
    end
  end

  private

    def memory_params
      params.require(:memory).permit(:name, :description)
    end
end
