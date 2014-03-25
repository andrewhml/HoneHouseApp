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
