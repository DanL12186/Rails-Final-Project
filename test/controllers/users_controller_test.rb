require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest

  test "should not save user without name" do
    user = User.new
    assert_not user.save
  end

  test "should not save without a password" do
    user = User.new(name: "Bart", email: "nopasswordguy@password.net")
    assert_not user.save
  end

  test "should save without an email" do
    user = User.new(name: "Bart", password: "globalfeats")
    assert user.save
  end

  test "should not create another user with same name" do
    user = User.create(name: "Homer", password: "doughnuts")
    user = User.new(name: "Homer", password: "doughnutluvr423")
    assert_not user.save
  end

  test "destroying user should destroy children" do
    user = User.create(name: "Lisa", password: "globalfeats")
    show = Show.create(name: "Bad Television", user_id: User.last.id)
    character = Character.create(name: "Steven Segal", show_id: Show.last.id)

    user.destroy

    assert_not Show.find_by(name: "Bad Television")
    assert_not Character.find_by(name: "Steven_Segal")
  end

end
