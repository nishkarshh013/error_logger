class CreateErrorOccurrences < ActiveRecord::Migration[7.1]
  def change
    create_table :error_occurrences do |t|
      t.references :error_group, null: false, foreign_key: true
      t.text :backtrace
      t.datetime :occurred_at

      t.timestamps
    end
  end
end
