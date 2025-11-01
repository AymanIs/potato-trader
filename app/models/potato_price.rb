class PotatoPrice < ApplicationRecord
    validates :price, presence: true, numericality: { greater_than: 0 }
    validates :recorded_at, presence: true
  
    scope :for_date, ->(date) {
      start_of_day = date.beginning_of_day
      end_of_day = date.end_of_day
      where(recorded_at: start_of_day..end_of_day)
        .order(recorded_at: :asc)
    }
  end