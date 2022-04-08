class Item < ApplicationRecord
  belongs_to :list

  before_save :set_priority

  private

  def set_priority
    self.priority = (list.items.maximum(:priority) || 0) + 1
  end
end
