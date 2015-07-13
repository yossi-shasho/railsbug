class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.references :taskable, polymorphic: true, index: true
      t.string :email, null: false

      t.timestamps null: false
    end
  end
end
