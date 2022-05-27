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
class Todo < ApplicationRecord
  has_many :photos, dependent: :destroy
  validates :title, presence: true, uniqueness: true
  validate :due_date_is_valid
  before_validation :set_title_default_if_it_is_empty

  private

    def due_date_is_valid
      if due_date < DateTime.now
        errors.add(:due_date, "Invalid due date")
      end
    end

    def set_title_default_if_it_is_empty
      self.title ||= (0...8).map { (65 + rand(26)).chr }.join
    end
end
