require 'test_helper'

class ShowsControllerTest < ActionDispatch::IntegrationTest

  test "Show can't be saved without a name" do
    user = User.create(name: "Name", password: "password")
    show = Show.new(user_id: User.last.id)
    assert_not show.save
  end

end
