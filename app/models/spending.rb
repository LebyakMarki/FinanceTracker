class Spending < ApplicationRecord
  belongs_to :user
  has_many :shares

  FILTER_PARAMS = %i[description amount_from amount_to category column direction].freeze

  scope :by_category, ->(category) { where(category: category) if category.present? }
  scope :by_amount_from, ->(amount_from) { where("spendings.amount > ?", amount_from) if amount_from.present? }
  scope :by_amount_to, ->(amount_to) { where("spendings.amount < ?", amount_to) if amount_to.present? }
  scope :by_description, ->(query) { where('spendings.description like ?', "%#{query}%") }



  def self.filter(filters)
    Spending
      .by_description(filters['description'])
      .by_category(filters['category'])
      .by_amount_from(filters['amount_from'])
      .by_amount_to(filters['amount_to'])
      .order("#{filters['column']} #{filters['direction']}")
  end
end
