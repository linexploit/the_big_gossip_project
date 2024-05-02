class Gossip < ApplicationRecord
  validates :title, length: {in: 3..14}, presence: true
  validates :content, presence: true
  belongs_to :user
  belongs_to :city
  has_many :gossip_tags
  has_many :tags, through: :gossip_tags
end
