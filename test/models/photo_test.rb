# == Schema Information
#
# Table name: photos
#
#  id         :integer          not null, primary key
#  image_url  :string
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  todo_id    :integer          not null
#
# Indexes
#
#  index_photos_on_todo_id  (todo_id)
#
# Foreign Keys
#
#  todo_id  (todo_id => todos.id)
#
require "test_helper"

class PhotoTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "should have a title value" do
    photo = Photo.new(image_url: "image.jpg")
    assert_not photo.save
  end

  test "should have a image_url value" do
    photo = Photo.new(title: "my image")
    assert_not photo.save
  end

  test "should not save if image_url is invalid" do
    photo = Photo.new(title: "my image", image_url: "image")
    assert_not photo.save
  end

  test "should save if image_url is valid" do
    photo = Photo.new(title: "my image", image_url: "image.jpg")
    assert photo.save
  end
end
