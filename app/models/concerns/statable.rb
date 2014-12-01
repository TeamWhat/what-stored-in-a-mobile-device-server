module Statable
  extend ActiveSupport::Concern

  def total_size
    size_count = 0
    self.class.const_get(name).all.each do |o|
      size_count += o.size
    end
    size_count
  end
end
