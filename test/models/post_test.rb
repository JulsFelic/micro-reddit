require 'test_helper'

class PostTest < ActiveSupport::TestCase

  def setup
    @post = Post.new(link_url: "http://www.jalopnik.com",
                     title: "Jalopnik Rules!", user_id: 3)
  end

  test "should be valid" do
    assert @post.valid?
  end

  test "link_url should not be blank" do
    @post.link_url = "    "
    assert_not @post.valid?
  end

  test "title should not be blank" do
    @post.title = "    "
    assert_not @post.valid?
  end

  test "title length should not be less than 6 characters" do
    @post.title = "a" * 5
    assert_not @post.valid?
  end

  test "title length should not be greater than 200 characters" do
    @post.title = "a" * 201
    assert_not @post.valid?
  end

  test "title should be unique" do
    duplicate_post = @post.dup
    duplicate_post.title = @post.title
    @post.save

    assert_not duplicate_post.valid?
  end

  test "user_id should be present" do
    @post.user_id = "    "
    assert_not @post.valid?
  end
end
