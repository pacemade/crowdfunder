
require 'test_helper'
class UserTest < ActiveSupport::TestCase
  test "email must have a unique" do
    user = create(:user, email: "bettymaker@gmail.com", password: "password", password_confirmation: "password")
    # user = User.create(email: "bettymaker@gmail.com", password: "12345678", password_confirmation: "12345678")
    # user2 = User.new(email: "bettymaker@gmail.com", password: "00000000", password_confirmation: "00000000")
    user2 = build(:user, email: "bettymaker@gmail.com", password: "password", password_confirmation: "password")

    refute user2.valid?
  end

  test "user must include password_confirmation on create" do
    user = build(:user, email: "bettymaker@gmail.com", password: "12345678")
    # user2 = create(:user, email: "betmaker@gmail.com", password: "12345678", password_confirmation: "12345678")
    refute user.valid?
  end

  test "password must match confirmation" do
    user = build(:user, email: "bettymaker@gmail.com", password: "12345678", password_confirmation: "87654321")
    refute user.valid?
  end

  test "password must be at least 8 characters long" do
    user = build(:user, email: "bettymaker@gmail.com", password: "1234", password_confirmation: "1234")
    refute user.valid?
  end

  test "sum of pledges correctly sums the pledges" do
    user = build(:user)
    project = build(:project)
    pledge1 = build(:pledge, user: user, project: project, dollar_amount: 100)
    pledge2 = build(:pledge, user: user, project: project, dollar_amount: 150)
    pledge3 = build(:pledge, user: user, project: project, dollar_amount: 200)


    assert 450, user.sum_of_pledges
  end
end
