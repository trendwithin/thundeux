require "test_helper"

class UserTest < ActiveSupport::TestCase

  def setup
    @user ||= users(:user_1)
  end

  test 'user should be valid' do
    assert @user.valid?
  end

  test 'presence of email' do
    @user.email = nil
    assert_not @user.valid?
  end

  test 'max length of email is 255 chars' do
    @user.email = 'a' * 249 + "@i.com"
    assert @user.valid?
  end

  test 'max length of email fails at 256' do
    @user.email = 'a' * 250 + "@i.com"
    assert_not @user.valid?
  end

  test 'presence of password' do
    @user.password = ''
    assert_not @user.valid?
  end

  test 'minimum password length 8' do
    @user.password = '1234567'
    assert_not @user.valid?
    assert_match /[\"is too short (minimum is 8 characters)\"]/, @user.errors[:password].to_s
  end
end
