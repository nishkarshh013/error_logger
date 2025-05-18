class CreateErrorGroups < ActiveRecord::Migration[7.1]
  def change
    create_table :error_groups do |t|
      t.references :app, null: false, foreign_key: true
      t.string :error_class
      t.text :message
      t.string :environment
      t.string :fingerprint
      t.integer :count

      t.timestamps
    end
  end
end
