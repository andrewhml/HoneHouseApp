class UnitsController < ApplicationController
  before_action :authorize, except: :show
  def new
    @unit = Unit.new
    @course = Course.find(params[:course_id].to_i)
  end

  def create
    # binding.pry
    @unit = Unit.new(unit_params)

    if @unit.save
      respond_to do |format|
        format.html { redirect_to course_url(@unit.course_id) }
        format.json { render json: @unit }
      end
    else
      flash.now[:errors] = @unit.errors.full_messages.join(', ')
      render :new
    end
  end

  def edit
    @unit = Unit.find(params[:id])
    @course = Course.find(params[:course_id])
  end

  def update
    @unit = Unit.find(params[:id])

    if @unit.update_attributes(unit_params)
      redirect_to course_path(@unit.course_id)
      flash[:notice] = 'You have successfully updated the course'
    else
      flash.now[:errors] = @course.errors.full_messages.join(', ')
      render :edit
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

  def authorize
    unauthorized! if (!user_signed_in? || !current_user.is_admin?)
  end
end
