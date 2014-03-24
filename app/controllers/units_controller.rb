class UnitsController < ApplicationController
  def new
    @unit = Unit.new
    @course = Course.find(params[:course_id].to_i)
  end

  def create
    @unit = Unit.new(unit_params)

    if @unit.save
      redirect_to course_url(@unit.course_id)
    else
      flash.now[:errors] = @unit.errors.full_messages.join(', ')
      render :new
    end
  end

  def destroy
    unit = Unit.find(params[:id])
    unit.destroy
    redirect_to :back
  end

  private

  def unit_params
    params.require(:unit).permit(:unit_number, :title, :description, :course_id)
  end
end
