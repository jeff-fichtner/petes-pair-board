class CreatePairingsTable < ActiveRecord::Migration
  def change
    create_table :pairings do |t|
      t.datetime :start_time
      t.integer :mentor_id
      t.integer :student_id
    end
  end
end
