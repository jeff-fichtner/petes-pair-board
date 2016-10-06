class CreateUsersTopics < ActiveRecord::Migration
  def change
    create_table :topics_users do |t|
      t.integer :mentor_id
      t.integer :topic_id

      t.timestamps(null:false)
    end
  end
end
