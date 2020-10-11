class TodoList < ApplicationRecord
  has_many :todo_items, dependent: :destroy
  has_one_attached :background
  validates :title, presence: true 
  def percent_completed
    return 0 if total_items == 0

    (100 * completed_items.to_f / total_items).round(1)
  end

  def completed_items
    @completed_items ||= todo_items.completed.count
  end

  def total_items
    @total_items ||= todo_items.count
  end

  def status
    case percent_completed.to_i
    when 0
      'Not Started'
    when 100
      'Complete'
    else
      'In Progress'
    end
  end

  def badge_color
    case percent_completed.to_i
    when 0
      'red-500 '
    when 100
      'green-500 '
    else
      'indigo-600 '
    end
  end
end
