require 'spec_helper'

feature 'Viewing a course page' do
  background do
    @course = create(:course)
    @admin = create(:user, role: 'admin')
    @user = create(:user, first_name: 'Mike')
    @membership = create(:membership, course: @course, user: @user, role: 'teacher')
    visit course_path(@course)
  end

  scenario 'a visitor can view the course page' do
    expect(page).to have_content 'Mike'
    expect(page).to have_content 'New HoneHouse Member'
    expect(page).to_not have_content 'Edit teacher'
  end

  scenario 'an admin can view links to create new course' do
    sign_in_as(@admin)
    visit course_path(@course)
    expect(page).to have_content 'Edit teacher'

  end
end
