class AddPositionToLessons < ActiveRecord::Migration[7.1]
  def change
    add_column :lessons, :position, :integer
  end
end
