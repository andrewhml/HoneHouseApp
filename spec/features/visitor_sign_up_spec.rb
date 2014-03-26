require 'spec_helper'

feature 'A visitor signs up' do
  background do
    visit root_path
    click_on 'Sign in'
  end

  scenario 'successfully with valid information' do
    expect(page).to have_content 'Sign in'

    click_on 'Sign up'
    expect(page).to have_content 'Sign up'

    fill_in 'First name', with: 'Mike'
    fill_in 'Last name', with: 'Stone'
    fill_in 'Email', with: 'example@example.com'
    fill_in 'Password', with: 'Swordfish'
    fill_in 'Password confirmation', with: 'Swordfish'

    click_button 'Sign up'
    expect(page).to have_content 'A message with a confirmation link has been sent to your email address. Please open the link to activate your account. Welcome to HoneHouse!'
  end

  scenario 'unsuccessfully with invalid form input' do
    click_on 'Sign up'
    expect(page).to have_content 'Sign up'

    fill_in 'First name', with: ''
    fill_in 'Last name', with: ''
    fill_in 'Email', with: ''
    fill_in 'Password', with: ''
    fill_in 'Password confirmation', with: ''

    click_button 'Sign up'
    expect(page).to have_content '4 errors prohibited this user from being saved:'
  end
end

feature 'A visitor sings in' do
  background do
    @user = create(:user)
    visit root_path
    click_on 'Sign in'
  end

  scenario 'successfully with valid information' do
    expect(page).to have_content 'Sign in'

    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    within('.new_user') do
      click_on 'Sign in'
    end
    expect(page).to have_content 'Signed in successfully.'
  end

  scenario 'unsuccessfully with invalid information' do
    expect(page).to have_content 'Sign in'

    fill_in 'Email', with: @user.email
    fill_in 'Password', with: "#{@user.password}xyz123"
    within('.new_user') do
      click_on 'Sign in'
    end
    expect(page).to_not have_content 'Signed in successfully.'
  end
end
