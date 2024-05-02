class AddForeignKeyConstraintToGossipTags < ActiveRecord::Migration[7.1]
  def change
    add_foreign_key :gossip_tags, :gossips, on_delete: :cascade
  end
end
