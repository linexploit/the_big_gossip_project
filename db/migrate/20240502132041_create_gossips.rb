class CreateGossips < ActiveRecord::Migration[7.1]
  def change
    create_table :gossips do |t|
      t.text :title
      t.text :content
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
