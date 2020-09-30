class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.text :title, null: false
      t.text :context
      t.text :comment
      t.string :user
      t.string :issuer, null: false
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
