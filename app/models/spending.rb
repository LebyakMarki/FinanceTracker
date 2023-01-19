class Spending < ApplicationRecord
  belongs_to :user

  FILTER_PARAMS = %i[description column direction].freeze

  scope :by_description, ->(query) { where('spendings.description like ?', "%#{query}%") }

  def self.filter(filters)
    Spending.by_description(filters['description'])
          .order("#{filters['column']} #{filters['direction']}")
  end
end
