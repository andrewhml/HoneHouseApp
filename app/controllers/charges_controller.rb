class ChargesController < ApplicationController
  before_action :authenticate_user!, :find_course, :check_membership

  def new
  end

  def create
    # Amount in cents
    @amount = 50

    if current_user.has_stripe_id?
      stripe_id = current_user.stripe_id
    else
      @customer = Stripe::Customer.create(
        :email => user_signed_in? ? current_user.email : nil,
        :card  => params[:stripeToken]
      )
      current_user.save_stripe_customer_id(@customer.id)
    end
    charge = Stripe::Charge.create(
      :customer    => current_user.has_stripe_id? ? current_user.stripe_id : @customer.id,
      :amount      => @amount,
      :description => @course.title,
      :currency    => 'usd'
    )

    if charge.present?
      flash[:notice] = "You have successfully registered for #{@course.title}!"
      Membership.create!(user_id: current_user.id, course_id: @course.id)
      redirect_to course_path(@course)
    end

    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to course_path(@course)

  end

  private

  def find_course
    @course = Course.find(params[:course_id])
  end

  def check_membership
    if @course.check_membership(current_user)
      flash[:alert] = "You are already registered for this course."
      redirect_to course_path(@course)
    end
  end
end
