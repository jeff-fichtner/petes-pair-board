class CreateFeedbacksTable < ActiveRecord::Migration
  def change
    create_table :feedbacks do |t|
      t.integer :rating
      t.text :comment
      t.integer :pairing_id
      t.integer :user_id

      t.timestamps(null:false)
    end
  end
end
