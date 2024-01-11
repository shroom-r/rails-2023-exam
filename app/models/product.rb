class Product < ApplicationRecord
  enum :category => %i[ beverage food toys ]

  validates :title, presence: true, uniqueness: true
  validates :price, numericality: { greater_than: 0 }
  validates :category, inclusion: { in: categories.keys }

  scope :discounted, -> { where(discounted: true) }
  scope :archived, -> { where.not(archived_at: nil) }
  scope :active, -> { where(archived_at: nil) }

  def discounted_price
    (0.8*price).round(2)
  end

  def archive!
    touch(:archived_at)
  end

  def archived?
    archived_at?
  end

  # def active

end
