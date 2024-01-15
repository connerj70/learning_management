class CreateLessons < ActiveRecord::Migration[7.1]
  def change
    create_table :lessons do |t|
      t.string :title
      t.text :description
      t.boolean :paid
      t.references :course, null: false, foreign_key: true

      t.timestamps
    end
  end
end
