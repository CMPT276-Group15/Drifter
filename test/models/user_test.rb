require 'test_helper'

class UserTest < ActiveSupport::TestCase

# describe User do
#   it {should have_many(:messages)}
# end
#   it {should belong_to(:sender).class_name('User')}
#   it {should have_many(:recipients)}
#   it {should have_many(:users).through(:recipients)}
#   it {should validate_presense_of(:sender)}
#   it {should validate_presense_of(:body)}
# end

  def setup
    @user = User.new(name: "Example User", email: "user@example.com",
            password: "foobar", password_confirmation: "foobar")

  end

  test "should be valid" do
    assert @user.valid?
  end

  test "name should be present" do
  @user.name = "     "
  assert_not @user.valid?
end
test "email should be present" do
   @user.email = "     "
   assert_not @user.valid?
 end
 test "name should not be too long" do
   @user.name = "a" * 51
   assert_not @user.valid?
 end

 test "email should not be too long" do
   @user.email = "a" * 244 + "@example.com"
   assert_not @user.valid?
 end

 test "email validation should accept valid addresses" do
  valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                       first.last@foo.jp alice+bob@baz.cn]
  valid_addresses.each do |valid_address|
    @user.email = valid_address
    assert @user.valid?, "#{valid_address.inspect} should be valid"
  end
end

test "email addresses should be unique" do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase

    @user.save
    assert_not duplicate_user.valid?
  end
  test "password should be present (nonblank)" do
  @user.password = @user.password_confirmation = " " * 6
  assert_not @user.valid?
end

test "password should have a minimum length" do
  @user.password = @user.password_confirmation = "a" * 5
  assert_not @user.valid?
end
test "authenticated? should return false for a user with nil digest" do
    assert_not @user.authenticated?('')
end
end
