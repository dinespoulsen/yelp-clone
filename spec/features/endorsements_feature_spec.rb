require 'rails_helper'

feature 'endorsing reviews' do

  let(:user) { User.create email: 'test@test.com', password: "123456"}
  let(:restaurant) { user.restaurants.create name: 'The Ivy'}
  let(:review_params) { {rating:4, thoughts: 'yum'} }

  subject(:review) { restaurant.reviews.create_with_user(review_params, user)}

  before do
    review
  end

  # scenario 'a user can endorse a review, which updates the review endorsement count', js: true do
  #   visit '/restaurants'
  #   click_link 'The Ivy'
  #   click_link 'Endorse Review'
  #   expect(page).to have_content('1 endorsement')
  # end

end
