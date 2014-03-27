require 'spec_helper'

feature 'A user can register for a course' do
  background do
    @course = create(:course)
    @user = create(:user)
    sign_in_as(@user)
  end

  scenario 'successfully' do
    visit course_path(@course)
    expect(page).to have_content 'Pay with Card'
    click_button 'Pay with Card'
  end
end
