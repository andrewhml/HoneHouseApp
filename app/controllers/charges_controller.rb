class ChargesController < ApplicationController
  before_action :authenticate_user!

  def new
  end

  def create

    # Amount in cents
    @amount = 10
    @course = Course.find(params[:course_id])

    customer = Stripe::Customer.create(
      :email => user_signed_in? ? current_user.email : nil,
      :card  => params[:stripeToken]
    )

    charge = Stripe::Charge.new(
      :customer    => customer.id,
      :amount      => @amount,
      :description => @course.title,
      :currency    => 'usd'
    )

    if charge.save
      flash[:notice] = "You have successfully registered for #{@course.title}!"
      Membership.create!(user_id: current_user.id, course_id: @course.id)
      redirect_to course_path(@course)
    else
      flash[:error] = e.message
      render :new
    end
  end
end
