class Product < ApplicationRecord
  enum :category => %i[ beverage food toys ]

  validates :title, presence: true
  validates :price, numericality: { greater_than: 0 }
  validates :category, inclusion: { in: categories.keys }

  scope :discounted, -> { where(discounted: true) }
  scope :archived, -> { where.not(archived_at: nil) }

  def discounted_price
    price
  end

  def archive!
    touch(:archived_at)
  end

  def archived?
    archived_at?
  end
end
