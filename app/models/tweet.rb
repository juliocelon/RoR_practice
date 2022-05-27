# == Schema Information
#
# Table name: tweets
#
#  id         :integer          not null, primary key
#  body       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  username   :string
#  surname    :string
#
class Tweet < ApplicationRecord
  after_create :send_notifications

  private
    def send_notifications
      puts "Send notifications"
    end
end
