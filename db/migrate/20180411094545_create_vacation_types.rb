class CreateVacationTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :vacation_types do |t|
      t.string :name
      t.boolean :active, default: true
    end
  end
end
