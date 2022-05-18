class AddNToTweets < ActiveRecord::Migration[7.0]
  def change
    add_column :tweets, :surname, :string
  end
end
