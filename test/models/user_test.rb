# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'name_or_email' do
    user = users(:alice)
    user.name = 'alice'
    assert_equal user.name, user.name_or_email
    user.name = ''
    assert_equal user.email, user.name_or_email
  end

  test 'follow' do
    me = users(:alice)
    other_user = users(:bob)
    assert_difference 'other_user.followers.count', 1 do
      me.follow(other_user)
    end
  end

  test 'unfollow' do
    carol = users(:carol)
    dava = users(:dava)
    assert_difference 'carol.followers.count', -1 do
      dava.unfollow(carol)
    end
  end

  test 'following?' do
    dava = users(:dava)
    carol = users(:carol)
    assert dava.following?(carol)
  end

  test 'followed_by?' do
    dava = users(:dava)
    carol = users(:carol)
    assert carol.followed_by?(dava)
  end
end
