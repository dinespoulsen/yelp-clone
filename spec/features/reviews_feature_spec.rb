require 'rails_helper'

feature 'reviewing' do
  before do
    user = User.create(email: "test@test.com", password: "testtest")
    user.restaurants.create(name: "Subway")
  end

  scenario 'allows users to leave a review using a form' do
    sign_up
    review_subway
    expect(current_path).to eq '/restaurants'
    expect(page).to have_content 'too short'
  end

  scenario 'allows users to only leave one review' do
    sign_up
    review_subway
    review_subway
    expect(page).to have_content 'You have already reviewed this restaurant'
  end

  scenario 'reviews show on restaurant page' do
    sign_up
    review_subway
    expect(page).to have_content 'too short'
  end
  scenario 'reviews can be deleted' do
    sign_up
    review_subway
    click_link 'Subway'
    click_link 'Delete Review'
    expect(page).not_to have_content 'too short'
  end
end
