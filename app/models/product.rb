class Product < ApplicationRecord
    # Concern
    include Notifications

    # Associations
    has_many :subscribers, dependent: :destroy

    # Virtual Attributes
    has_one_attached :featured_image
    has_rich_text :description

    # Attributes
    validates :name, presence: true
    validates :inventory_count, numericality: { greater_than_or_equal_to: 0 }
  end
  