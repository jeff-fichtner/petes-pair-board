class CreateFeedbacksTable < ActiveRecord::Migration
  def change
    create_table :feedbacks_tables do |t|
      t.integer :feedbackable_id
      t.string :feedbackable_type
      t.integer :rating
      t.text :comment
      t.integer :pairing_id
    end
  end
end
