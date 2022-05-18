# == Schema Information
#
# Table name: todos
#
#  id          :integer          not null, primary key
#  title       :string
#  description :text
#  due_date    :datetime
#  priority    :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
require "test_helper"

class TodoTest < ActiveSupport::TestCase

  test "title should not be empty" do
    todo = Todo.new
    todo.save
    puts "Errors: #{todo.errors.full_messages}" 
    assert todo.errors.any?, "No errors found"
  end

  test "todo should be saved if title is presented" do
    todo = Todo.new
    todo.title = "My title"
    todo.save
    assert todo.persisted?
  end

end
