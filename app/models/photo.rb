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
class Photo < ApplicationRecord
  belongs_to :todo
  has_and_belongs_to_many :tags
  # validates :title, presence: true, uniqueness: { message: "title [%{value}] has been already used on [%{attribute}] field of model [%{model}]" }
  validates :title, presence: true, uniqueness: { message: ->(object, data) { "data= [#{data}], data=[#{data[:value]}], object: [#{object.title}]"} }
  validates :image_url, presence: true, format: { with:  /.\.(jpg|png|jpeg|gif)/ , message: "The image url: [%{value}] is on Invalid format"}
  # scope :latest, -> { order("id desc") }
  scope :latest, ->(my_limit) { order("id desc").limit(my_limit) } do
    def foo 
      puts "Hi everyone!"
    end
  end
  scope :ascendent, -> { order("id asc") }

  def self.paginate(page=1, per_page=15)
    Photo.order("id desc").offset((page - 1)* per_page).limit(per_page)
  end
end
