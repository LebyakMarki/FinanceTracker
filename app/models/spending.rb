class Spending < ApplicationRecord
  belongs_to :user

  FILTER_PARAMS = %i[description category column direction].freeze

  scope :by_category, ->(category) { where(category: category) if category.present? }
  scope :by_description, ->(query) { where('spendings.description like ?', "%#{query}%") }

  def self.filter(filters)
    Spending
      .by_description(filters['description'])
      .by_category(filters['category'])
      .order("#{filters['column']} #{filters['direction']}")
  end
end
