require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "1. should not save User without first name" do
    user = User.new
    user.last_name = 'Ipsum'
    user.email = 'lorem@gmail.com'
    user.encrypted_password = User.new.send(:password_digest, '1234567')
    assert_not user.save, 'Saved User without first name'
  end

  test "2. should not save User without last name" do
    user = User.new
    user.first_name = 'Lorem'
    user.email = 'lorem@gmail.com'
    user.encrypted_password = User.new.send(:password_digest, '1234567')
    assert_not user.save, 'Saved User without last name'
  end

  test "3. should not save User without email" do
    user = User.new
    user.first_name = 'Lorem'
    user.last_name = 'Ipsum'
    user.encrypted_password = User.new.send(:password_digest, '1234567')
    assert_not user.save, 'Saved User without email'
  end

  test "4. should not save User without encrypted password" do
    user = User.new
    user.first_name = 'Lorem'
    user.last_name = 'Ipsum'
    user.email = 'lorem@gmail.com'
    assert_not user.save, 'Saved User without encrypted password'
  end
end
