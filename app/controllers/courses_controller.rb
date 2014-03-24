class CoursesController < ApplicationController
  def index
    @courses = Course.all
  end

  def show
    @course = Course.find(params[:id]).includes(:lesson)
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)
    if @course.save
      redirect_to course_path(@course)
      flash[:notice] = 'You have successfully created a new course'
    else
      flash.now[:errors] = @course.errors.full_messages.join(', ')
      render :new
    end
  end

  def edit
    @course = Course.find(params[:id])
  end

  def update
    @course = Course.new(course_params)

    if @course.save
      redirect_to course_path(@course)
      flash[:notice] = 'You have successfully updated the course'
    else
      flash.now[:errors] = @course.errors.full_messages.join(', ')
      render :edit
    end
  end

  def destroy
    @course.destroy
    flash[:notice] = "Course deleted"
    redirect_to 'courses#index'
  end

  private

  def course_params
    params.require(:course).permit(:title, :subtitle, :sport)
  end
end
