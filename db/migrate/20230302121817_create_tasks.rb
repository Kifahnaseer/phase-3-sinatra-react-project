class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.string :name
      t.text :description
      t.date :date_to_complete
      t.boolean :follow_up
    end
  end
end
