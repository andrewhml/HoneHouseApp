require 'spec_helper'

feature 'Editing a course page' do
  background do
    @course = create(:course)
    @admin = create(:user, role: 'admin')
    @user = create(:user, first_name: 'Mike')
    @membership = create(:membership, course: @course, user: @user, role: 'teacher')
    visit course_path(@course)
  end

  scenario 'a visitor cannot edit a course' do
    visit edit_course_path(@course)
    expect(page).to have_content 'unauthorized!'
  end

  scenario 'a general user cannot edit a course' do
    sign_in_as(@user)
    visit edit_course_path(@course)
    expect(page).to have_content 'unauthorized!'
  end

  scenario 'an admin user can edit a course with valid information' do
    sign_in_as(@admin)
    visit edit_course_path(@course)
    expect(page).to have_content @course.title

    fill_in 'Title', with: 'Another HoneHouse Class'
    fill_in 'Subtitle', with: 'Another Sample Class'

    click_button 'Create Class'

    expect(page).to have_content 'You have successfully updated the course'
  end

  scenario 'an admin user cannot create a course with invalid information' do
    sign_in_as(@admin)
    visit edit_course_path(@course)

    fill_in 'Title', with: ''

    click_button 'Create Class'

    expect(page).to have_content "Title can't be blank"
  end
end
