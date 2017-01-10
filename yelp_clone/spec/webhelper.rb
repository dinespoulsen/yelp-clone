def sign_up
 visit("/users/sign_up")
 fill_in("user[email]", with: "test@example.com")
 fill_in("user[password]", with: "testtest")
 fill_in("user[password_confirmation]", with: "testtest")
 click_button("Sign up")
end
