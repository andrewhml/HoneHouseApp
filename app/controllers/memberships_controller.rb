class MembershipsController < ApplicationController
  def new
    @membership = Membership.new
    @course = Course.find(params[:course_id])
  end

  def create
    @membership = Membership.new(membership_params)
    if @membership.save
      flash[:notice] = 'Registration complete'
      redirect_to course_path(@membership.course_id)
    else
      flash.now[:errors] = @membership.errors.full_messages.join(', ')
      render :new
    end
  end

  def edit
    @membership = Membership.find(params[:id])
    @course = Course.find(params[:course_id])
  end

  def update
    membership = Membership.find(params[:id])
    if membership.update_attributes(membership_params)
      flash[:notice] = 'Successful update'
      redirect_to course_path(membership.course_id)
    else
      flash.now[:errors] = membership.errors.full_messages.join(', ')
      render :edit
    end
  end

  private

  def membership_params
    params.require(:membership).permit(:user_id, :course_id, :role)
  end
end
