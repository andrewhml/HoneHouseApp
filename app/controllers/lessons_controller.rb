class LessonsController < ApplicationController
  def new
    @lesson = Lesson.new
    @unit = Unit.find(params[:unit_id])
  end

  def create
    @lesson = Lesson.new(lesson_params)

    if @lesson.save
      redirect_to course_path(@lesson.find_course)
    else
      render :new
    end

  end

  def edit
    @lesson = Lesson.find(params[:id])
  end

  def update
    @lesson = Lesson.find(params[:id])
    if @lesson.update_attributes(lesson_params)
      redirect_to course_path(@lesson.find_course)
    end
  end

  def destroy
  end

  private

  def lesson_params
    params.require(:lesson).permit(:title, :description, :unit_id)
  end
end
