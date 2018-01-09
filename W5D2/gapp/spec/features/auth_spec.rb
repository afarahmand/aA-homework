require 'spec_helper'
require 'rails_helper'

feature 'the signup process' do
  scenario 'has a new user page'
  expect(page).to have_content 'Sign Up'

  feature 'signing up a user' do

    scenario 'shows username on the homepage after signup'
    User.create!(username: 'Joe', password: 'password')
    sign_in('Joe')
    expect(page).to have_content("Joe")
  end
end

feature 'logging in' do
  scenario 'shows username on the homepage after login'

end

feature 'logging out' do
  scenario 'begins with a logged out state'

  scenario 'doesn\'t show username on the homepage after logout'

end
