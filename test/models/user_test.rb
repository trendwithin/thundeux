require "test_helper"

class UserTest < ActiveSupport::TestCase

  def setup
    @user ||= users(:user_1)
  end

  def test_valid
    assert @user.valid?
  end

end
