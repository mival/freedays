class CreateVacationRequests < ActiveRecord::Migration[5.1]
  def change
    create_table :vacation_requests do |t|
      t.date :start_day, null: false
      t.date :end_day, null: false
      t.boolean :accepted
      t.references :user # t.integer :user_id, foreign_key: { primary_key: :id2}, index: true // Important
      t.references :vacation_type
    end
  end
end
