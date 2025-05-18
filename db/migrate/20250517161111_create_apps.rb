class CreateApps < ActiveRecord::Migration[7.1]
  def change
    create_table :apps do |t|
      t.string :name
      t.string :api_key
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
