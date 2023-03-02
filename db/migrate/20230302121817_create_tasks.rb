class CreateTasks < ActiveRecord::Migration[6.1]

  def change
    create_table :tasks do |t|
      t.string :name
      t.text :description
      t.date :date_to_complete
      t.boolean :follow_up
      t.integer :id_of_user
      
    end
  end
end
