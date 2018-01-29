require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest


  def test_user_show_profile
    user = User.create!(
      first_name: "Danny",
      last_name: "Chang",
      email: "email@email.com",
      password: 'password',
      password_confirmation: 'password'
    )

    post user_sessions_path, params: {email: user.email, password: "password"}
    get user_path(user)

    assert_response :success
    assert_match("User:", @response.body)
    assert_match(user.first_name, @response.body)
  end

end
