require 'spec_helper'

feature 'A visitor can view a course' do
  background do
    @course = create(:course, title: 'Lacrosse 101', subtitle: 'Learn core lacrosse skills')
  end
  scenario 'successfully' do
    visit course_path(@course)
    expect(page).to have_content 'Lacrosse 101'
    expect(page).to have_content 'Learn core lacrosse skills'
    expect(page).to have_content 'Course Curriculum'
  end

  scenario 'But not sign up for a course' do
    visit course_path(@course)
    click_on 'Sign in to register'
    expect(page).to have_content 'Sign in'
  end
end
