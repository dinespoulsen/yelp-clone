def sign_up( email: 'george@hotmail.com',
             password: 'george')
  visit '/users/sign_up'
  fill_in :user_email, with: email
  fill_in :user_password, with: password
  fill_in :user_password_confirmation, with:password
  click_button 'Sign up'
end

def sign_in
  visit '/users/sign_in'
  fill_in :user_email, with: 'george@hotmail.com'
  fill_in :Password, with: 'george'
  click_button 'Log in'
end