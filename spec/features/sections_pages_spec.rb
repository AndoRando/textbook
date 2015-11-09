require 'spec_helper'

describe Section, js: true do
  let(:author) { FactoryGirl.create(:author) }
  let(:student) { FactoryGirl.create(:student) }
  let!(:course) { FactoryGirl.create(:course) }
  let!(:section) { FactoryGirl.create(:section) }

  it 'can be created by an author' do
    login_as(author, scope: :user)
    visit courses_path
    click_link 'New section'
    fill_in 'Name', with: 'Awesome section'
    fill_in 'Section number', with: '1'
    fill_in 'Section week', with: '1'
    click_button 'Create Section'
    expect(page).to have_content 'Awesome section'
  end

  it 'displays errors if you try to save an invalid section' do
    login_as(author, scope: :user)
    visit courses_path
    click_link 'New section'
    click_button 'Create Section'
    expect(page).to have_content "Please correct these problems:"
  end

  it 'cannot be created by a student' do
    login_as(student, scope: :user)
    visit courses_path
    expect(page).to_not have_content 'New section'
    visit new_section_path
    expect(page).to_not have_content 'New'
  end

  it 'can be edited by an author' do
    login_as(author, scope: :user)
    visit edit_section_path(section)
    fill_in 'Name', with: 'New awesome section'
    fill_in 'Section week', with: '3'
    click_button 'Update Section'
    expect(page).to have_content 'Section updated'
  end

  it 'cannot be edited by a student' do
    login_as(student, scope: :user)
    visit courses_path
    expect(page).to_not have_content 'edit'
    visit edit_section_path section
    expect(page).to_not have_content 'Edit'
  end

  it 'can be deleted by an author' do
    login_as(author, scope: :user)
    visit courses_path
    click_link "delete_section_#{section.id}"
    expect(page).to_not have_content section.name
  end

  it 'cannot be deleted by a student' do
    login_as(student, scope: :user)
    visit courses_path
    expect(page).to_not have_content 'delete'
  end
end
