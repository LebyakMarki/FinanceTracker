module SpendingsHelper
  def build_order_link(column:, label:)
    if column == session.dig('spending_filters', 'column')
      link_to(label, list_spendings_path(column: column, direction: next_direction), class:"link-light")
    else
      link_to(label, list_spendings_path(column: column, direction: 'asc'), class:"link-light")
    end
  end

  def next_direction
    session['spending_filters']['direction'] == 'asc' ? 'desc' : 'asc'
  end

  def sort_indicator
    tag.span(class: "sort sort-#{session['spending_filters']['direction']}")
  end

end
