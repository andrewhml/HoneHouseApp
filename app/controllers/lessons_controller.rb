class LessonsController < ApplicationController
  before_action :authorize, except: :show
  def new
    @lesson = Lesson.new
    if params[:course_id].present?
      @course = Course.find(params[:course_id])
    end
    if params[:unit_id].present?
      @unit = Unit.find(params[:unit_id])
    end
  end

  def create
    @lesson = Lesson.new(lesson_params)
    @unit = Unit.find(lesson_params[:unit_id].to_i)
    if @lesson.save
      respond_to do |format|
        format.html {redirect_to course_path(@lesson.find_course)}
        format.json { render json: @lesson }
      end
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
    lesson = Lesson.find(params[:id])
    lesson.destroy
    redirect_to :back
  end

  private

  def lesson_params
    params.require(:lesson).permit(:title, :description, :unit_id)
  end

  def authorize
    unauthorized! if (!user_signed_in? || !current_user.is_admin?)
  end
end
