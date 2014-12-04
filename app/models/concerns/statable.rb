module Statable
  extend ActiveSupport::Concern

  def total_size
    size_count = 0
    table.all.each do |o|
      size_count += o.size
    end
    size_count
  end

  def average_age
    average(:time_difference, 86_400)
  end

  def average_size
    average(:size, 1000)
  end

  def maximum_age
    extreme_value(:time_difference, :max_by, 86_400)
  end

  def minimum_age
    extreme_value(:time_difference, :min_by, 86_400)
  end

  def minimum_size
    extreme_value(:size, :min_by, 1000)
  end

  def maximum_size
    extreme_value(:size, :max_by, 1000)
  end

  def total_count
    table.all.count
  end

  private

  def table
    self.class.const_get(name)
  end

  def extreme_value(calculation, sort, divider)
    return if table.all.empty?
    extreme = table.all.send sort do |o|
      send(calculation, o)
    end
    send(calculation, extreme) / divider
  end

  def average(calculation, divider)
    average = 0
    table.all.each do |o|
      average += send(calculation, o)
    end
    average /= total_count unless total_count == 0
    average / divider
  end

  def time_difference(o)
    o.date.to_time.to_i - o.date_added.to_time.to_i
  end

  def size(o)
    o.size
  end
end
