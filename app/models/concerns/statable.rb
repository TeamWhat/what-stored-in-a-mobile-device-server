module Statable
  extend ActiveSupport::Concern

  def total_size
    size_count = 0
    table.all.each do |o|
      size_count += o.size
    end
    size_count
  end

  def total_count
    table.all.count
  end

  def table
    self.class.const_get(name)
  end
end
