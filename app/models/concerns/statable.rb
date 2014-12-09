# Methods to calculate stuff on all the objects in the table
module Statable
  extend ActiveSupport::Concern

  # Calculates total size
  def total_size
    size_count = 0
    table.all.each do |o|
      size_count += o.size
    end
    size_count
  end

  # Calculates average age
  def average_age
    average(:time_difference, 86_400)
  end

  # Calculates average size
  def average_size
    average(:size, 1000)
  end

  # Calculates maximum age
  def maximum_age
    extreme_value(:time_difference, :max_by, 86_400)
  end

  # Calculates minimum age
  def minimum_age
    extreme_value(:time_difference, :min_by, 86_400)
  end

  # Calculates minimum size
  def minimum_size
    extreme_value(:size, :min_by, 1000)
  end

  # Calculates maximum size
  def maximum_size
    extreme_value(:size, :max_by, 1000)
  end

  # Calculates total number of objects in the table
  def total_count
    table.all.count
  end

  private

  # Returns the name of the table, e.g. Image
  def table
    self.class.const_get(name)
  end

  # Calculates the maximum or minimum value
  # calculation defines comparing method, e.g. size
  # sort defines whether minimum or maximum value is returned
  # divider defines what units the result will be in, e.g. converts seconds to days
  def extreme_value(calculation, sort, divider)
    return if table.all.empty?
    extreme = table.all.send sort do |o|
      send(calculation, o)
    end
    send(calculation, extreme) / divider
  end

  # Calculates average value
  # calculation defines comparing method, e.g. size
  # divider defines what units the result will be in, e.g. converts seconds to days
  def average(calculation, divider)
    average = 0
    table.all.each do |o|
      average += send(calculation, o)
    end
    average /= total_count unless total_count == 0
    average / divider
  end

  # Calculates time difference between collection date and the date the object was created
  def time_difference(o)
    o.date.to_time.to_i - o.date_added.to_time.to_i
  end

  # Size
  def size(o)
    o.size
  end
end
