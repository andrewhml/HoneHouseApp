class CoursesController < ApplicationController
  before_action :authorize, except: [:index, :show]
  def index
    @courses = Course.all
  end

  def show
    @course = Course.find(params[:id])
    if @course.memberships.find_by_role('teacher')
      @membership = @course.memberships.find_by_role('teacher')
      @teacher =  @course.find_teacher
    else
      @membership = nil
      @teacher = nil
    end
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)
    if @course.save
      redirect_to new_course_unit_path(@course)
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
    @course = Course.find(params[:id])

    if @course.update_attributes(course_params)
      redirect_to course_path(@course)
      flash[:notice] = 'You have successfully updated the course'
    else
      flash.now[:errors] = @course.errors.full_messages.join(', ')
      render :edit
    end
  end

  def destroy
    course = Course.find(params[:id])
    if course.destroy
      flash[:error] = "Course deleted"
      redirect_to root_url
    end
  end

  private

  def course_params
    params.require(:course).permit(:title, :subtitle, :sport, :url, :description, :course_image)
  end

  def authorize
    unauthorized! if (!user_signed_in? || !current_user.is_admin?)
  end
end
