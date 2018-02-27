class CreateTodos < ActiveRecord::Migration[5.1]
  def change
    create_table :todos do |t|
      t.string :name
      t.string :description
      t.integer :duration

      t.timestamps
    end
  end
end
