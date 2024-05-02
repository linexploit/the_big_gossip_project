class CreateComments < ActiveRecord::Migration[7.1]
  def change
    create_table :comments do |t|
      t.string :anonymous_commentator
      t.text :content
      t.references :user, null: false, foreign_key: true
      t.references :gossip, null: false, foreign_key: true

      t.timestamps
    end
  end
end
