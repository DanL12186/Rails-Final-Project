require 'test_helper'

class ShowsControllerTest < ActionDispatch::IntegrationTest

  test "Show can't be saved without a name" do
    user = User.create(name: "Name", password: "password")
    show = Show.new(user_id: User.last.id)
    assert_not show.save
  end

  test "Show is successfully created with valid data" do
    user = User.create(name: "Name", password: "password")
    show = Show.new(name: "Good show!", user_id: User.last.id)
    assert show.save
  end

end
