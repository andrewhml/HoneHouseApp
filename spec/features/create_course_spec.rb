require 'spec_helper'

feature 'Creating a course page' do
  background do
    @course = create(:course)
    @admin = create(:user, role: 'admin')
    @user = create(:user, first_name: 'Mike')
    @membership = create(:membership, course: @course, user: @user, role: 'teacher')
    visit course_path(@course)
  end

  scenario 'a visitor cannot create a course' do
    visit new_course_path
    expect(page).to have_content 'unauthorized!'
  end

  scenario 'a general user cannot create a course' do
    sign_in_as(@user)
    visit new_course_path
    expect(page).to have_content 'unauthorized!'
  end

  scenario 'an admin user can create a course with valid information' do
    sign_in_as(@admin)
    visit new_course_path
    expect(page).to have_button 'Create Class'

    fill_in 'Title', with: 'HoneHouse Class'
    fill_in 'Subtitle', with: 'Sample Class'
    fill_in 'Description', with: 'Sample description'
    fill_in 'Url', with: '//www.youtube.com/embed/hsVhU6OVTe0'

    click_button 'Create Class'

    expect(page).to have_content 'You have successfully created a new course'
  end

  scenario 'an admin user cannot create a course with invalid information' do
    sign_in_as(@admin)
    visit new_course_path

    fill_in 'Subtitle', with: 'Sample Class'
    fill_in 'Description', with: 'Sample description'
    fill_in 'Url', with: '//www.youtube.com/embed/hsVhU6OVTe0'

    click_button 'Create Class'

    expect(page).to have_content "Title can't be blank"
  end
end
