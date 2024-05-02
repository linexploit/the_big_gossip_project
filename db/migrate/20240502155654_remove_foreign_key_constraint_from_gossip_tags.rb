class RemoveForeignKeyConstraintFromGossipTags < ActiveRecord::Migration[7.1]
  def change
    remove_foreign_key :gossip_tags, :gossips
  end
end
