class CatsController < ApplicationController
  def index
    @cats = Cat.all.sort_by{|cat| cat.name }
  end

  def show
    @cat = Cat.find(params[:id])
  end

  def edit
    @cat = Cat.find(params[:id])
  end

  def update
    @cat = Cat.find(params[:id])
    if @cat.update(cat_params)
      flash[:success] = "cat with id: #{params[:id]} updated"
      redirect_to cats_path
    else
      flash[:error] = "cat with id: #{params[:id]} not updated"
      redirect_to cats_path
    end
  end

  def new
    @cat = Cat.new
  end

  def destroy
    @cat = Cat.find(params[:id])
    if @cat
      if @cat.destroy
        flash[:success] = "cat destroyed"
        redirect_to cats_path
      end
    end
  end

  def create
    @cat = Cat.new(cat_params)
    if @cat && @cat.save
      success_message = "cat was successfully saved."
      flash[:success] = success_message
      redirect_to cats_path
    else
      error_message = "cat was not succesfully saved."
      flash[:error] = error_message
      render "new"
    end
  end

  private
    def cat_params
      params.require(:cat).permit(:name, :age, :fur_color, :eye_color, :food_type, :owner_id)
    end
end
