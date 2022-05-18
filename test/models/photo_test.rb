# == Schema Information
#
# Table name: photos
#
#  id         :integer          not null, primary key
#  title      :string
#  image_url  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
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
