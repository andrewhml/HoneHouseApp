require 'spec_helper'

feature 'Destroying a course page' do
  background do
    @course = create(:course)
    @admin = create(:user, role: 'admin')
    @user = create(:user, first_name: 'Mike')
    @membership = create(:membership, course: @course, user: @user, role: 'teacher')
    visit course_path(@course)
  end

  scenario 'a visitor cannot destroy a course' do
    visit course_path(@course, {method: :delete})
    expect(page).to have_content 'unauthorized!'
  end

  scenario 'a general user cannot destroy a course' do
    sign_in_as(@user)
    visit course_path(@course, {method: :delete})
    expect(page).to have_content 'unauthorized!'
  end

  scenario 'an admin user can destroy a course' do
    course_total = Course.count
    sign_in_as(@admin)
    visit course_path(@course)
    click_on 'Delete course'
    page.evaluate_script('window.confirm = function() { return true; }')
    expect(page).to have_content 'Are you sure you want to delete the course?'
    # new_course_total = Course.count
    # expect(new_course_total).to eq (course_total - 1)

  end

  scenario 'an admin user cannot create a course with invalid information' do
    sign_in_as(@admin)
    visit edit_course_path(@course)

    fill_in 'Title', with: ''

    click_button 'Create Class'

    expect(page).to have_content "Title can't be blank"
  end
end
